Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web09.6442.1610014889258255037
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 02:21:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4DBMhj4Hc6z5tlC;
	Thu,  7 Jan 2021 11:21:25 +0100 (CET)
Date: Thu, 7 Jan 2021 11:21:24 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Sana Kazi <Sana.Kazi@kpit.com>
Cc: Openembedded-core@lists.openembedded.org, raj.khem@gmail.com,
	nisha.parrakat@kpit.com, Aditya.Tayade@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: Re: [OE-core] [poky][sumo][PATCH 4/4] libsndfile1: fix CVE-2019-3832
Message-ID: <20210107102124.whs2taob6gt3losh@qschulz>
References: <20210107101101.31004-1-sanak@kpit.com>
MIME-Version: 1.0
In-Reply-To: <20210107101101.31004-1-sanak@kpit.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sana,

Unless I'm mistaken, sumo is EOL and not supported anymore.

The latest version that is still maintained by the community is zeus
(3.0). The latest version officially maintained is dunfell (3.1),
meaning this one will still receive dot releases, not the community one
though commits can be pushed to the "community-maintained" branch.

Please stop sending patches for sumo. Maintain it on your own, ask to
become a community maintainer or upgrade to current/maintained versions.

Best regards,
Quentin

On Thu, Jan 07, 2021 at 03:41:01PM +0530, Sana Kazi wrote:
> From: Ross Burton <ross.burton@intel.com>
> 
> The previous fix for CVE-2018-19758 wasn't complete, so backport another patch
> to solve it properly.
> 
> (From OE-Core rev: aeaca9bb1b1c8bf44818945dc4b2cbd6d4b5cef2)
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> ---
>  .../libsndfile1/CVE-2019-3832.patch           | 37 +++++++++++++++++++
>  .../libsndfile/libsndfile1_1.0.28.bb          |  5 +++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch
> 
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch
> new file mode 100644
> index 0000000000..ab37211399
> --- /dev/null
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch
> @@ -0,0 +1,37 @@
> +From 43886efc408c21e1e329086ef70c88860310f25b Mon Sep 17 00:00:00 2001
> +From: Emilio Pozuelo Monfort <pochu27@gmail.com>
> +Date: Tue, 5 Mar 2019 11:27:17 +0100
> +Subject: [PATCH] wav_write_header: don't read past the array end
> +
> +CVE-2018-19758 wasn't entirely fixed in the fix, so fix it harder.
> +
> +CVE: CVE-2019-3832
> +Upstream-Status: Backport [7408c4c788ce047d4e652b60a04e7796bcd7267e]
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +If loop_count is bigger than the array, truncate it to the array
> +length (and not to 32k).
> +
> +CVE-2019-3832
> +
> +---
> + src/wav.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/wav.c b/src/wav.c
> +index daae3cc..8851549 100644
> +--- a/src/wav.c
> ++++ b/src/wav.c
> +@@ -1094,8 +1094,10 @@ wav_write_header (SF_PRIVATE *psf, int calc_length)
> +               psf_binheader_writef (psf, "44", 0, 0) ; /* SMTPE format */
> +               psf_binheader_writef (psf, "44", psf->instrument->loop_count, 0) ;
> +
> +-              /* Loop count is signed 16 bit number so we limit it range to something sensible. */
> +-              psf->instrument->loop_count &= 0x7fff ;
> ++              /* Make sure we don't read past the loops array end. */
> ++              if (psf->instrument->loop_count > ARRAY_LEN (psf->instrument->loops))
> ++                      psf->instrument->loop_count = ARRAY_LEN (psf->instrument->loops) ;
> ++
> +               for (tmp = 0 ; tmp < psf->instrument->loop_count ; tmp++)
> +               {       int type ;
> +
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> index b28f675286..e52105fa2b 100644
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> @@ -13,6 +13,11 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
>             file://CVE-2017-14245-14246.patch \
>             file://CVE-2017-14634.patch \
>             file://CVE-2018-13139.patch \
> +           file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
> +           file://CVE-2018-19432.patch \
> +           file://CVE-2017-12562.patch \
> +           file://CVE-2018-19758.patch \
> +           file://CVE-2019-3832.patch \
>            "
> 
>  SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
> --
> 2.17.1
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.

> 
> 
> 


-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
Fax: +43 1 667 20 02 4401
quentin.schulz@streamunlimited.com, www.streamunlimited.com
