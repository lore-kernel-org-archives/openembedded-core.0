Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RHfOn-0000Oh-CX
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Oct 2011 19:30:22 +0200
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga01.intel.com with ESMTP/TLS/RC4-MD5; 22 Oct 2011 10:24:22 -0700
Received: by pzk4 with SMTP id 4so27497860pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2011 10:24:22 -0700 (PDT)
Received: by 10.68.1.1 with SMTP id 1mr21749569pbi.55.1319304260462;
	Sat, 22 Oct 2011 10:24:20 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id x7sm44284316pbf.5.2011.10.22.10.24.19
	(version=SSLv3 cipher=OTHER); Sat, 22 Oct 2011 10:24:19 -0700 (PDT)
Message-ID: <4EA2FC42.7050206@intel.com>
Date: Sat, 22 Oct 2011 10:24:18 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <bcdfb52940fbceb12549f4725ad808ae496afdb3.1319184832.git.Martin.Jansa@gmail.com>
	<1319190483-5637-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1319190483-5637-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] base.bbclass: add subversion-native to DEPENDS if there is svn:// in SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Oct 2011 17:30:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2011 02:48 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/classes/base.bbclass |    7 +++++++
>   1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index f539744..bced226 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -401,6 +401,13 @@ python () {
>                       bb.note("SKIPPING %s because it's %s" % (pn, this_license))
>                       raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
>
> +    # Svn packages should DEPEND on subversion-native
> +    srcuri = bb.data.getVar('SRC_URI', d, 1)
> +    if "svn://" in srcuri:
> +        depends = bb.data.getVarFlag('do_fetch', 'depends', d) or ""
> +        depends = depends + " subversion-native:do_populate_sysroot"
> +        bb.data.setVarFlag('do_fetch', 'depends', depends, d)
> +
>       # Git packages should DEPEND on git-native
>       srcuri = bb.data.getVar('SRC_URI', d, 1)
>       if "git://" in srcuri:
This change introduces a circular dependency when I tried to build.

Sau!


