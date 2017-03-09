Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id C9233775D1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 23:12:26 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g10so9669109wrg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 15:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S2fIwBuTt7u9XzSlJmqEaaLK78kdHq1wnl1wC5W8LUQ=;
	b=DoQ9xt3KMhsg4ZsEoGdbBYSt/0pD0bFHNi/uGvT/jkxL1j8J46xp8cPdaniInuU9CN
	DdMwXn1Ie0FH51dYTTs9/lfdaFC7vUz1k+VjDJfL3SE5C0ls77QoRHiNFDfAJipTb+Th
	nY9ntljn/Qg/tD+vNfuJU7N6/crQeiJcRrWG1ggqR+WrgBzWlBs0f0QKbQN8LBgSsokf
	jL8AHKRCU/zetJ/E0bZcJwkgX0ctBXPnganmjGrL9UGs+zNbau7fhWRJqEjnIdJ8iWqD
	psB7BPbazBbVCJqziaQU7g4qMQ35sfND0FK+CLvhCs0Dd932xL0x5aReCrJcRtNvgT6B
	LKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S2fIwBuTt7u9XzSlJmqEaaLK78kdHq1wnl1wC5W8LUQ=;
	b=GyuYZQxTmwj4Qz6IZNDklveyGiA1MOzzciH4NeoMFXzW9Uq5pTqn9Z8Plw+7Co70EA
	jGkYzJcxvzu1fX4cQJbTHGXAX02/49JB8gNLSdAOMDqSxr7NsNmhqGz/MekSSwqHoxUR
	L1F6tHS/zlFJXcJdGCOQkzS3lEJBucDke1YjcJZ/8ayYxvlTa6iCAYWiG/+d2nLzIh7u
	LkWtgLsJoUbh41PE1SVL4rlH8MeY5s5zWD4igxORVABO2Zpujs+cB/zgHbDXvcyyxM7n
	iVoCDHZCcoaKy2k2LgkssMvtOpJOVNI7vQoQd9zBu3+XE+9lerLG0Ogf4bN8a6HbtFw0
	tk8w==
X-Gm-Message-State: AMke39mJ406NTpSWZvRwaCPpqfEXHrNPwV+qx5qQIpVRpL2pWHLdOMckr07VRsT1QAnjuz7R/MBZN8iGSbOcSQ==
X-Received: by 10.223.152.239 with SMTP id w102mr13757851wrb.72.1489101147243; 
	Thu, 09 Mar 2017 15:12:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Thu, 9 Mar 2017 15:12:26 -0800 (PST)
In-Reply-To: <1489097854-19523-5-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489097854-19523-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1489097854-19523-5-git-send-email-richard.purdie@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 9 Mar 2017 15:12:26 -0800
Message-ID: <CAJ86T=WiLnnvgiJyE2S_i1TCsbZXooeJaBNEcJBAi+gVxebh2Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] base/bitbake.conf: Filter contents of PATH to only allow whitelisted tools
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
X-List-Received-Date: Thu, 09 Mar 2017 23:12:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 9, 2017 at 2:17 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We currently have a determinism problem in that the host tools present
> in PATH can influence the build. In particular, the presence of pkg-config
> on the build host can mask missing pkgconfig class dependencies.
>
> This adds in a new HOSTTOOLS variable and then uses it to set up a directory
> of symlinks to the whitelisted host tools. This directory is placed as PATH
> instead of the usual /usr/bin:/bin and so on.
>
> This should improve determinism of builds and avoid the issues which have
> been particularly obvious since the introduction of recipe specific sysroots.
>
> If users find there is a tool missing, they can extend HOSTTOOLS from a global
> class or global conf file.
>
> Right now the settings should be enough to build everything in OE-Core.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass | 22 ++++++++++++++++++++++
>  meta/conf/bitbake.conf    | 18 ++++++++++++++++++
>  meta/conf/layer.conf      |  1 +
>  3 files changed, 41 insertions(+)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 14293f8..fec351a 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -119,6 +119,25 @@ def get_lic_checksum_file_list(d):
>              bb.fatal(d.getVar('PN') + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)
>      return " ".join(filelist)
>
> +def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
> +    tools = d.getVar(toolsvar).split()
> +    origbbenv = d.getVar("BB_ORIGENV", False)
> +    path = origbbenv.getVar("PATH")
> +    bb.utils.mkdirhier(dest)
> +    notfound = []
> +    for tool in tools:
> +        desttool = os.path.join(dest, tool)
> +        if not os.path.exists(desttool):
> +            srctool = bb.utils.which(path, tool)
> +            if "ccache" in srctool:
> +                srctool = bb.utils.which(path, tool, direction=1)
> +            if srctool:
> +                os.symlink(srctool, desttool)
> +            else:
> +                notfound.append(tool)
> +    if notfound and fatal:
> +        bb.fatal("These tools appear to be unavailable in PATH, please install them in order to proceed:\n%s" % " ".join(notfound))
> +
>  addtask fetch
>  do_fetch[dirs] = "${DL_DIR}"
>  do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
> @@ -219,6 +238,9 @@ python base_eventhandler() {
>          pkgarch_mapping(e.data)
>          oe.utils.features_backfill("DISTRO_FEATURES", e.data)
>          oe.utils.features_backfill("MACHINE_FEATURES", e.data)
> +        # Works with the line in layer.conf which changes PATH to point here
> +        setup_hosttools_dir(d.expand('${TMPDIR}/hosttools'), 'HOSTTOOLS', d)
> +        setup_hosttools_dir(d.expand('${TMPDIR}/hosttools'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
>
>      if isinstance(e, bb.event.BuildStarted):
>          localdata = bb.data.createCopy(e.data)
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f9df7ca..3f6fed8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -453,6 +453,24 @@ export PATH
>  # Build utility info.
>  ##################################################################
>
> +# Tools needed to run builds with OE-Core
> +HOSTTOOLS += " \
> +    bash sh cut sed gcc ld git rm install which find xargs cat true mktemp \
> +    grep tar gzip touch cp mv basename dirname tr getopt sort awk head tail \
> +    mkdir patch uniq perl python chmod python3 ar strip expr ls make as \
> +    ranlib egrep echo chown cpio tee wc wget bzip2 stat date rmdir od diff \
> +    md5sum dd chrpath file pod2man gunzip python2.7 ln g++ [ false true \
> +    uname test hostname nm objdump objcopy cmp printf env readlink gawk fgrep \
> +    expand pwd sleep diffstat chgrp flock ldd strings rpcgen du makeinfo \
> +    getconf \
> +"

Sorting and removing the duplicate "true" results in:

    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
    cut date dd diff diffstat dirname du echo egrep env expand expr false \
    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
    head hostname install ld ldd ln ls make makeinfo md5sum mkdir mktemp mv \
    nm objcopy objdump od patch perl pod2man printf pwd python python2.7 \
    python3 ranlib readlink rm rmdir rpcgen sed sh sleep sort stat strings \
    strip tail tar tee test touch tr true uname uniq wc wget which xargs \

> +
> +# Tools needed to run testimage runtime image testing
> +HOSTTOOLS += "ps stty ip ssh scp ping vi"
> +
> +# Link to these if present
> +HOSTTOOLS_NONFATAL += "ccache pip3 ld.bfd ld.gold"

The s3 fetcher currently relies on aws from the host, so that should
perhaps be included here. The same comment probably applies to some of
the other fetchers too.

>  CCACHE ??= ""
>  # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
>  # of ccache some distributions (e.g., Fedora 17).
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 87c235f..a70f1e1 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -59,3 +59,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    oprofile->virtual/kernel \
>  "
>
> +PATH = "${TMPDIR}/hosttools"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

