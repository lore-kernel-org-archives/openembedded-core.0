Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF286E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3O7Khh9026809; Fri, 24 Apr 2015 08:20:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GmdrAODMBhVG; Fri, 24 Apr 2015 08:20:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3O7KTqn026797
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Apr 2015 08:20:41 +0100
Message-ID: <1429860029.26983.127.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Fri, 24 Apr 2015 08:20:29 +0100
In-Reply-To: <2894e3f1ce4dc1dc2a6ab45859b0425e21184a7a.1429858183.git.Qi.Chen@windriver.com>
References: <cover.1429858183.git.Qi.Chen@windriver.com>
	<2894e3f1ce4dc1dc2a6ab45859b0425e21184a7a.1429858183.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] populate_sdk_base: avoid executing empty function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Apr 2015 07:20:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-04-24 at 14:50 +0800, Chen Qi wrote:
> `bitbake uninative-tarball' raises the following warning.
> 
>     WARNING: Function  doesn't exist
> 
> This is because SDK_PACKAGING_FUNC is set to "" in its recipe.
> Anyway, we need to check this variable to avoid executing empty function.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 5c07693..6e3e84f 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -94,7 +94,11 @@ fakeroot python do_populate_sdk() {
>  
>      bb.build.exec_func("tar_sdk", d)
>  
> -    bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
> +    sdk_packaging_func = d.getVar("SDK_PACKAGING_FUNC", True)
> +    if sdk_packaging_func:
> +        sdk_packaging_func = sdk_packaging_func.strip()
> +        if sdk_packaging_func != "":
> +            bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)

This is slightly overcomplicated. You can just do something like:

sdk_packaging_func = d.getVar("SDK_PACKAGING_FUNC", True) or ""
if sdk_packaging_func.strip():
    bb.build.exec_func(sdk_packaging_func, d)

Cheers,

Richard


