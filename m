Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF0971AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 23:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1GNrVRt012796; Thu, 16 Feb 2017 23:53:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id h2uhaCNPUYXH; Thu, 16 Feb 2017 23:53:31 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1GNrQDe012787
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Feb 2017 23:53:29 GMT
Message-ID: <1487289205.4999.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 15:53:25 -0800
In-Reply-To: <1487288761-22432-1-git-send-email-sgw@linux.intel.com>
References: <1487288761-22432-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] native.bbclass: populate native recipe with it's files
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
X-List-Received-Date: Thu, 16 Feb 2017 23:53:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-02-16 at 15:46 -0800, Saul Wold wrote:
> This allows a native package's recipe-sysroot-native to be populated
> with
> that packages native image files.  This in turns allows it to be used
> by
> scripts or other tools without creating un-necessary DEPENDS.
> 
> An example of this is systemtap-native and the crosstap script.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/native.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/native.bbclass
> b/meta/classes/native.bbclass
> index ec91fc3..d9dfea7 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -174,6 +174,11 @@ python native_virtclass_handler () {
>  addhandler native_virtclass_handler
>  native_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
>  
> +python do_addto_recipe_sysroot () {
> +    bb.build.exec_func("extend_recipe_sysroot", d)
> +}
> +addtask addto_recipe_sysroot after do_populate_sysroot before
> do_build
> +
>  inherit nopackages

I'm fine with adding this task as a shortcut to allow the particular
recipe to be run from a recipe sysroot. What I don't want is every
recipe needing to run this all the time which the "before do_build"
enables. Can we do this without the do_build piece and manually run the
task where needed?

Cheers,

Richard

