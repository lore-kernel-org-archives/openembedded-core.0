Return-Path: <aborduno@cisco.com>
X-Greylist: delayed 553 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Oct 2016 14:07:16 UTC
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	by mail.openembedded.org (Postfix) with ESMTP id 5166F71A3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2135; q=dns/txt; s=iport;
	t=1476886041; x=1478095641;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=6FtW2kv6oGcvKGDrVuRbldR9/tRH5GWhEOVw/Tf7h/w=;
	b=PQ3NffSdbiV47T1VQj+un+For03OBtlxjvJffwRhFYv/z14MOGJy7Df7
	5pv1rgoID+3zbXophtIrEGLxN32Y9bA2KBS4uctRZF79FRrVH4PxWCgys
	5tyDsmVbMrRpjLwORH4yj6qQ/WaTJVh54Pt2Y0VC4fpb42tTRC+31r1d+ 8=;
X-IronPort-AV: E=Sophos;i="5.31,514,1473120000"; d="scan'208";a="161634759"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
	by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Oct 2016 13:58:05 +0000
Received: from kbp1-dhp-f50810.synapse.com ([10.24.115.201])
	(authenticated bits=0)
	by rcdn-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id u9JDw1xh017279
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 19 Oct 2016 13:58:04 GMT
To: openembedded-core@lists.openembedded.org
References: <1476118955-12401-1-git-send-email-aborduno@cisco.com>
From: Andrii Bordunov <aborduno@cisco.com>
Message-ID: <2f612347-5351-fc20-956e-1cf84a5189ff@cisco.com>
Date: Wed, 19 Oct 2016 16:58:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476118955-12401-1-git-send-email-aborduno@cisco.com>
X-Authenticated-User: aborduno
Cc: Andrii Bordunov <aborduno@cisco.com>
Subject: Re: [PATCH] package.bbclass: allow using EXCLUDE_FROM_SHLIBS for subpackages
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
X-List-Received-Date: Wed, 19 Oct 2016 14:07:19 -0000
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit

Ping? Any comments?



Thank you,
Andrii

On 10.10.16 20:02, Andrii Bordunov wrote:
> Some packages containing shared libraries might be registered
> as shlib providers when they shouldn't (for example, the lib is for
> their private use and must not generate any dependency).
>
> EXCLUDE_FROM_SHLIBS is targeted at that, but it could be set
> for entire recipe only.
>
> This patch expands EXCLUDE_FROM_SHLIBS usage, so now it's possible
> to set it in a style similar with RDEPENDS. For example:
>  EXCLUDE_FROM_SHLIBS_${PN}-ptest = "1"
>
> Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
> ---
>  meta/classes/package.bbclass | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index a6f0a7a..9bf43dc 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1499,6 +1499,14 @@ python package_do_shlibs() {
>      libdir_re = re.compile(".*/%s$" % d.getVar('baselib', True))
>
>      packages = d.getVar('PACKAGES', True)
> +
> +    shlib_pkgs = []
> +    for pkg in packages.split():
> +        if d.getVar('EXCLUDE_FROM_SHLIBS_' + pkg, 0):
> +            bb.note("not generating shlibs for %s" % pkg)
> +        else:
> +            shlib_pkgs.append(pkg)
> +
>      targetos = d.getVar('TARGET_OS', True)
>
>      workdir = d.getVar('WORKDIR', True)
> @@ -1614,7 +1622,7 @@ python package_do_shlibs() {
>      needed = {}
>      shlib_provider = oe.package.read_shlib_providers(d)
>
> -    for pkg in packages.split():
> +    for pkg in shlib_pkgs:
>          private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True) or ""
>          private_libs = private_libs.split()
>          needs_ldconfig = False
> @@ -1684,7 +1692,7 @@ python package_do_shlibs() {
>
>      libsearchpath = [d.getVar('libdir', True), d.getVar('base_libdir', True)]
>
> -    for pkg in packages.split():
> +    for pkg in shlib_pkgs:
>          bb.debug(2, "calculating shlib requirements for %s" % pkg)
>
>          deps = list()
>

