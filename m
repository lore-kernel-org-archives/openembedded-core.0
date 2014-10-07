Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7DAAD7139A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 18:27:09 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id at20so5674183iec.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 11:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jt24/TBH9FLLwb+OZNMDC/JUqDUPELPbxMcz6kywkhA=;
	b=tl+KxeUpeXRD21TDSD3/66xD7qqpmYj+6A/TSrxO3bI4h55xNlQC/DYRFgG4MLpOQl
	wwo8jhAmkF60ShduTz7Rsm7hVNLnvfX8LX3yD9MgKY1WZfnSU5C4g4It9x8Fi8rUfAKV
	VIcJtAt9wKxyU0hP8vHle4mhEdgRsehb03Rz19a0HqNctOGTVa3hbvdgzuMsGwUwSFWu
	q9lc65pxFA3EBxnk5Bt7g1VHyZ2WM0VTFBT2wVIMJAKo86uM8zJF1bt7IoLpmbmgZg8v
	LnqA/yjZ/K02KPCaJvtOpIGMSOrVJcVLsRo0FftZMDdQlmm0HsD/uJAz0TMAR5JMGVPK
	hW9w==
X-Received: by 10.50.20.4 with SMTP id j4mr8544149ige.13.1412706431076; Tue,
	07 Oct 2014 11:27:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.179.5 with HTTP; Tue, 7 Oct 2014 11:26:41 -0700 (PDT)
In-Reply-To: <1412001614-15126-1-git-send-email-ross.burton@intel.com>
References: <1412001614-15126-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Oct 2014 11:26:41 -0700
Message-ID: <CAMKF1spb6t8rOScNXg_iteqLK48JLik-+fivXX4m6-oJbNv5ow@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: add SRCREV to do_fetch() hash
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
X-List-Received-Date: Tue, 07 Oct 2014 18:27:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 29, 2014 at 7:40 AM, Ross Burton <ross.burton@intel.com> wrote:
> Without this changing just the SRCREV won't re-fetch unless you embed the SRCREV
> into PV.
>
> The downside here is that every hash changes, so this causes a full rebuild.
>

can we back port this to daisy as well.

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/base.bbclass |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index c0d61fe..ff8c633 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -97,6 +97,7 @@ PATH_prepend = "${@extra_path_elements(d)}"
>  addtask fetch
>  do_fetch[dirs] = "${DL_DIR}"
>  do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
> +do_fetch[vardeps] += "SRCREV"
>  python base_do_fetch() {
>
>      src_uri = (d.getVar('SRC_URI', True) or "").split()
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

