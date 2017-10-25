Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63A7F6E666
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 08:06:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9P86MNc027258
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Oct 2017 01:06:22 -0700 (PDT)
Received: from [128.224.163.244] (128.224.163.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 25 Oct 2017 01:06:22 -0700
To: Armin Kuster <akuster808@gmail.com>, <akuster@mvista.com>,
	<openembedded-core@lists.openembedded.org>
References: <1508917783-11437-1-git-send-email-akuster808@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <1b1cd084-b33f-9d21-282a-03aa82550b86@windriver.com>
Date: Wed, 25 Oct 2017 16:04:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1508917783-11437-1-git-send-email-akuster808@gmail.com>
X-Originating-IP: [128.224.163.244]
Subject: Re: [PATCH 1/2] tzcode-native: update to 2017d
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
X-List-Received-Date: Wed, 25 Oct 2017 08:06:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Should be 2017c ?

I encountered a zdump build error on Ubuntu 14.04:

zdump.c:803:1: error: static declaration of ‘snprintf’ follows
non-static declaration
|  snprintf(char *s, size_t size, char const *format, ...)
|  ^

There was a discussion for it on upstream mailing list: 
http://mm.icann.org/pipermail/tz/2017-October/025364.html


Thanks,
Yi

在 2017年10月25日 15:49, Armin Kuster 写道:
> LICENSE changes do to rewording
>
> https://github.com/eggert/tz/commit/7097a652778d35acf747d14f8bf7b3ced479bbc0#diff-9879d6db96fd29134fc802214163b95a
>
> Changes to code
>
>      zic and the reference runtime now reject multiple leap seconds
>      within 28 days of each other, or leap seconds before the Epoch.
>      As a result, support for double leap seconds, which was
>      obsolescent and undocumented, has been removed.  Double leap
>      seconds were an error in the C89 standard; they have never existed
>      in civil timekeeping.  (Thanks to Robert Elz and Bradley White for
>      noticing glitches in the code that uncovered this problem.)
>
>      zic now warns about use of the obsolescent and undocumented -y
>      option, and about use of the obsolescent TYPE field of Rule lines.
>
>      zic now allows unambiguous abbreviations like "Sa" and "Su" for
>      weekdays; formerly it rejected them due to a bug.  Conversely, zic
>      no longer considers non-prefixes to be abbreviations; for example,
>      it no longer accepts "lF" as an abbreviation for "lastFriday".
>      Also, zic warns about the undocumented usage with a "last-"
>      prefix, e.g., "last-Fri".
>
>      Similarly, zic now accepts the unambiguous abbreviation "L" for
>      "Link" in ordinary context and for "Leap" in leap-second context.
>      Conversely, zic no longer accepts non-prefixes such as "La" as
>      abbreviations for words like "Leap".
>
>      zic no longer accepts leap second lines in ordinary input, or
>      ordinary lines in leap second input.  Formerly, zic sometimes
>      warned about this undocumented usage and handled it incorrectly.
>
>      The new macro HAVE_TZNAME governs whether the tzname external
>      variable is exported, instead of USG_COMPAT.  USG_COMPAT now
>      governs only the external variables "timezone" and "daylight".
>      This change is needed because the three variables are not in the
>      same category: although POSIX requires tzname, it specifies the
>      other two variables as optional.  Also, USG_COMPAT is now 1 or 0:
>      if not defined, the code attempts to guess it from other macros.
>
>      localtime.c and difftime.c no longer require stdio.h, and .c files
>      other than zic.c no longer require sys/wait.h.
>
>      zdump.c no longer assumes snprintf.  (Reported by Jonathan Leffler.)
>
>      Calculation of time_t extrema works around a bug in GCC 4.8.4
>      (Reported by Stan Shebs and Joseph Myers.)
>
>      zic.c no longer mistranslates formats of line numbers in non-English
>      locales.  (Problem reported by Benno Schulenberg.)
>
>      Several minor changes have been made to the code to make it a
>      bit easier to port to MS-Windows and Solaris.  (Thanks to Kees
>      Dekker for reporting the problems.)
>
>    Changes to documentation and commentary
>
>      The two new files 'theory.html' and 'calendars' contain the
>      contents of the removed file 'Theory'.  The goal is to document
>      tzdb theory more accessibly.
>
>      The zic man page now documents abbreviation rules.
>
>      tz-link.htm now covers how to apply tzdata changes to clients.
>      (Thanks to Jorge Fábregas for the AIX link.)  It also mentions MySQL.
>
>      The leap-seconds.list URL has been updated to something that is
>      more reliable for tzdb.  (Thanks to Tim Parenti and Brian Inglis.)
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   .../tzcode/{tzcode-native_2017b.bb => tzcode-native_2017c.bb}  | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>   rename meta/recipes-extended/tzcode/{tzcode-native_2017b.bb => tzcode-native_2017c.bb} (63%)
>
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb b/meta/recipes-extended/tzcode/tzcode-native_2017c.bb
> similarity index 63%
> rename from meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> rename to meta/recipes-extended/tzcode/tzcode-native_2017c.bb
> index 165d2c6..c8a987f 100644
> --- a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> +++ b/meta/recipes-extended/tzcode/tzcode-native_2017c.bb
> @@ -3,16 +3,16 @@
>   SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
>   LICENSE = "PD & BSD & BSD-3-Clause"
>   
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ef1a352b901ee7b75a75df8171d6aca7"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
>   
>   SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
>              http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
>   UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
>   
> -SRC_URI[tzcode.md5sum] = "afaf15deb13759e8b543d86350385b16"
> -SRC_URI[tzcode.sha256sum] = "4d1735bb54e22b8d7443d4d1f1a13d007ae11be79a35e51f8e8322fb8e292d40"
> -SRC_URI[tzdata.md5sum] = "50dc0dc50c68644c1f70804f2e7a1625"
> -SRC_URI[tzdata.sha256sum] = "f8242a522ea3496b0ce4ff4f2e75a049178da21001a08b8e666d8cbe07d18086"
> +SRC_URI[tzcode.md5sum] = "2fe6986231db5182c61d565021a0cd7b"
> +SRC_URI[tzcode.sha256sum] = "81e8b4bc23e60906640c266bbff3789661e22f0fa29fe61b96ec7c2816c079b7"
> +SRC_URI[tzdata.md5sum] = "1e751e7e08f8b68530674f04619d894d"
> +SRC_URI[tzdata.sha256sum] = "d6543f92a929826318e2f44ff3a7611ce5f565a43e10250b42599d0ba4cbd90b"
>   
>   S = "${WORKDIR}"
>   


