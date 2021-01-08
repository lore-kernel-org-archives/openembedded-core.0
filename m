Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Zm/+KC9gi2nKO88oyFLGEy/aBhaUV/UJOZ9sBvcDm4VCEHFUXraRsnHO0TDLkq0Jfc+sT4d3OG
 emU0d1/ZDNhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613634"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613634"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:24 -0800
IronPort-SDR: Ho4X22/vwC/kn6+BFzw3MQO/32H821mGZCfsFwRuh/riexu+7IxU7yuOQMpNPMbItsLMdz1t1r
 X1GJ5eA9cS/Q==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209352"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:23 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/30] timezone: upgrade to 2020e
Date: Fri,  8 Jan 2021 12:17:46 +0800
Message-Id: <9b291019c128652951e4ddd569813cd89843f6bb.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Briefly:
  Volgograd switches to Moscow time on 2020-12-27 at 02:00.

Changes to future timestamps

  Volgograd changes time zone from +04 to +03 on 2020-12-27 at 02:00.
  (Thanks to Alexander Krivenyshev and Stepan Golosunov.)

Changes to past timestamps

  Correct many pre-1986 transitions, fixing entries originally
  derived from Shanks.  The fixes include:
    - Australia: several 1917 through 1971 transitions
    - Bahamas: several 1941 through 1945 transitions
    - Bermuda: several 1917 through 1956 transitions
    - Belize: several 1942 through 1968 transitions
    - Ghana: several 1915 through 1956 transitions
    - Israel and Palestine: several 1940 through 1985 transitions
    - Kenya and adjacent: several 1908 through 1960 transitions
    - Nigeria and adjacent: correcting LMT in Lagos, and several 1905
      through 1919 transitions
    - Seychelles: the introduction of standard time in 1907, not 1906
    - Vanuatu: DST in 1973-1974, and a corrected 1984 transition
  (Thanks to P Chan.)

  Because of the Australia change, Australia/Currie (King Island) is
  no longer needed, as it is identical to Australia/Hobart for all
  timestamps since 1970 and was therefore created by mistake.
  Australia/Currie has been moved to the 'backward' file and its
  corrected data moved to the 'backzone' file.

Changes to past time zone abbreviations and DST flags

  To better match legislation in Turks and Caicos, the 2015 shift to
  year-round observance of -04 is now modeled as AST throughout before
  returning to Eastern Time with US DST in 2018, rather than as
  maintaining EDT until 2015-11-01.  (Thanks to P Chan.)

Changes to documentation

  The zic man page now documents zic's coalescing of transitions
  when a zone falls back just before DST springs forward.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9d7643339b4db6609b2bad1f76599a54da9d17f2)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 5368464f30..d175f0d4a0 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020d"
+PV = "2020e"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "6cf050ba28e8053029d3f32d71341d11a794c6b5dd51a77fc769d6dae364fad5"
-SRC_URI[tzdata.sha256sum] = "8d813957de363387696f05af8a8889afa282ab5016a764c701a20758d39cbaf3"
+SRC_URI[tzcode.sha256sum] = "3e10308976b09305d15cb4a32ff75483421f2063bfa24a9be366a027e7cd2902"
+SRC_URI[tzdata.sha256sum] = "0be1ba329eae29ae1b54057c3547b3e672f73b3ae7643aa87dac85122bec037e"
-- 
2.29.2

