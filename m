Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E78617953E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 06:36:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w866b0c5010354
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2018 23:37:00 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 5 Sep 2018 23:37:00 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1535359523.git.Qi.Chen@windriver.com>
	<109a0b6ce47245c63976bccef4258160a96197c5.1535359523.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <52ec79b4-4215-827a-2e3e-654fdd2ed722@windriver.com>
Date: Thu, 6 Sep 2018 14:41:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <109a0b6ce47245c63976bccef4258160a96197c5.1535359523.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/1] staging.bbclass: avoid staging native components for target sysroot
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
X-List-Received-Date: Thu, 06 Sep 2018 06:37:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 08/27/2018 04:46 PM, Chen Qi wrote:
> In the staging_populate_sysroot_dir function, components are staged
> by pkgarch matching. In case of x86-64 targets, it's possible that
> the native components are also matched, and thus are expectedly installed.
>
> The negative effect is at least unnecessary installation, and in some
> cases is compilation error. For example, when using eSDK and we are trying
> to cross compile some project in lib32 environment, the compilation will
> fail.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/staging.bbclass | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index 27b012e..1b9803a 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -198,6 +198,9 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
>               if manifest.endswith("-initial.populate_sysroot"):
>                   # skip glibc-initial and libgcc-initial due to file overlap
>                   continue
> +            if not native and manifest.endswith("-native.populate_sysroot"):
> +                # avoid native components to be installed into target sysroot
> +                continue
>               tmanifest = targetdir + "/" + os.path.basename(manifest)
>               if os.path.exists(tmanifest):
>                   continue



