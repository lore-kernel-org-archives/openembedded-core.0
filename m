Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 500947850D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 16:44:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y206so5024998wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 09:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dn5Q609dSDnhZUsJg1Sw+5g0MAWNfktTMg9APxkiuGg=;
	b=AhlllN8ecOJOAyE2HEpe0fL/u5ctUd4WYeC3f763rQ9bjm9EN3qzAGmFTX9UkMqCKU
	QTJUMO0VSLsL1Z1wZraL1U/8pYzKKtOtFhXv8lYNDY80cPyd2B1trHlmYrolHKDBsW+C
	leRTCTwLmG2Hh0aao97Jw4h3NufnmNwBBFGi2G9R9oJRUnFqWnqjvEta2nUxUd1wZJMl
	IZX7Juv5Cka4PQRo0bbb4OmYI5rbo7S/gjx5+ivrJE/SN9pACezMyXrRihSun9ZJiGnx
	FfKVqdKBIPykWfzM/b7xRCtgXeqK2POl8bmtmUiKL0BZnLIIYxfLRguHRiSTw6Htta16
	Efaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dn5Q609dSDnhZUsJg1Sw+5g0MAWNfktTMg9APxkiuGg=;
	b=MGcChwyvMXmsGZ2YMDBxV6aMezHRpn/C48sxJWwfBqULZaErakhh1tfr0yRSayrnFl
	LkccAhN3zoIDgAhwYuG5GpPL9qizu6vXlW2u9vEzCUZmw/0AtPOMl8ilz3cl88E0HIDm
	T0tM7mBwFFCHYBZdAL0HKUE0TnoZ+dQJ1KJAzt0JpwKWudPkKXiTgkZx9wByO17Dub/c
	cnbInnHRLEjOcxTm/LiOgwiFnUSeCssndRa76yvbgUgmEuN4+4+Y8kCoyFIo+bsT8g8l
	uL/jux/Ihk8GQ+CnUQPQrwTgh7Oso/d44DOQFtRrWR9jEsbuxNcC6T0Mqj3rTMoDMh0x
	qAjw==
X-Gm-Message-State: AIVw112YS0plwZxjwf+vaiX0PKdyiNx80GvMU+2JGD90+jrlz+wldODZ
	YWMOlPb0Nf5f2EU7XtACWwLfXlaYxg==
X-Received: by 10.80.145.38 with SMTP id e35mr7487385eda.8.1501260291083; Fri,
	28 Jul 2017 09:44:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Fri, 28 Jul 2017 09:44:20 -0700 (PDT)
In-Reply-To: <97b966925eaaf20263e0f8938806b6e015fc6c70.1501253351.git-series.patrick.ohly@intel.com>
References: <cover.1afd007ce6c93979d7d4cc2eb225b84710ca1a65.1501253351.git-series.patrick.ohly@intel.com>
	<97b966925eaaf20263e0f8938806b6e015fc6c70.1501253351.git-series.patrick.ohly@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 09:44:20 -0700
Message-ID: <CAMKF1sq12PyVfGStOaeuSBHx0c96chYuD7jM27pfpcm9zNurhg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] autoconf-archive: simplify and fix recipe
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
X-List-Received-Date: Fri, 28 Jul 2017 16:44:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 7:49 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> The COPYING file specifies pure GPLv3, not GPLv2 & GPLv3. There is
> also the COPYING.EXCEPTION file with the autotools exception, which
> gets ignored here in the recipe to keep it simpler.
>
> All of the explicit dependencies seem unnecessary, and RDEPENDS_${PN}
> doesn't do anything for native recipes either, so all of that gets
> removed.
>
> It also built fine without the m4 and parallel build workarounds.
>
> There's no need to have a separate .inc file.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-devtools/autoconf-archive/autoconf-archive.inc           | 13 -------------
>  meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb | 14 +++++++-------
>  2 files changed, 7 insertions(+), 20 deletions(-)
>  delete mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
>
> diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> deleted file mode 100644
> index 4f63e0f..0000000
> --- a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -LICENSE = "GPLv3"
> -HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
> -SECTION = "devel"
> -
> -DEPENDS += "m4-native"
> -DEPENDS_class-native = "m4-native gnu-config-native"
> -DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
> -
> -RDEPENDS_${PN} = "m4 gnu-config"
> -
> -SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
> -
> -inherit autotools
> diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
> index 0a1a771..d77c37d 100644
> --- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
> +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
> @@ -1,13 +1,13 @@
> -require autoconf-archive.inc
> -
> -
> -PARALLEL_MAKE = ""
> -
> -LICENSE = "GPLv2 & GPLv3"
> +SUMMARY = "a collection of freely re-usable Autoconf macros"
> +HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
> +SECTION = "devel"
> +LICENSE = "GPLv3"

Perhaps  GPL-3.0-with-autoconf-exception would be more accurate here.

>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>  SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
>  SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
>
> -EXTRA_OECONF += "ac_cv_path_M4=m4"
> +inherit autotools
> +
>  BBCLASSEXTEND = "native nativesdk"
> --
> git-series 0.9.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

