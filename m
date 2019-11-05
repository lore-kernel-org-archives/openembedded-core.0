Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id F006E7F953
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:08:48 +0000 (UTC)
IronPort-SDR: mPgIwd3no8ShVJ+Ok1ABIWLc26veVIf9IszcoXoWvLc3RzjQ3IfTXcI6qOpEgHJKBA/zaBGxbV
	iEH9yNse5uU1ap9u6mChWyLLdnItM2c7bLORNbhXY35qXUZjqlmczKN93vwWD1uHNXLHsNy99a
	A8oFtgTTYbUBToT43/hDdUtDRm/ZVrFdpbUXvObNgKKEuqr3BW8YRXMxgAqobL27ldDrwr9mRZ
	XnjiBAL21hVRPjW6iSZX31cwvDgbqlebUPf9dnKQv6EwgEpDpC+eoOYBKj789RjkLyhi8sS6Qc
	DTM=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2200440"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:08:36 +0100
Message-Id: <91a60888c1e2ecd72084dd65dd83ffe32092fbd1.1572991610.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1572991610.git.pkj@axis.com>
References: <cover.1572991610.git.pkj@axis.com>
MIME-Version: 1.0
Subject: [warrior][PATCHv2 6/9] tzdata: Correct the packaging of /etc/localtime and /etc/timezone
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
X-List-Received-Date: Tue, 05 Nov 2019 22:08:49 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

During restructuring of the packaging in 2af4d6eb (tzdata: Install
everything by default), these two files remained in the tzdata
package, which is supposed to be empty. Move them to tzdata-core where
they belong.

Also simplify the definition of CONFFILES_tzdata-core. As its value
only takes effect for files that actually exist, there is no need to
complicate its definition by checking if a file is created before
adding it to the list of configuration files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/timezone/tzdata.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 82fe369baa..1e2d9bd1b9 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -147,6 +147,8 @@ FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
 RPROVIDES_tzdata-misc = "tzdata-misc"
 
 FILES_tzdata-core += " \
+                ${sysconfdir}/localtime                  \
+                ${sysconfdir}/timezone                   \
                 ${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/America/Anchorage    \
                 ${datadir}/zoneinfo/America/Los_Angeles  \
@@ -202,8 +204,7 @@ FILES_tzdata-core += " \
                 ${datadir}/zoneinfo/iso3166.tab          \
                 ${datadir}/zoneinfo/Etc/*"
 
-CONFFILES_tzdata-core += "${@ "${sysconfdir}/timezone" if bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE')) else "" }"
-CONFFILES_tzdata-core += "${sysconfdir}/localtime"
+CONFFILES_tzdata-core = "${sysconfdir}/localtime ${sysconfdir}/timezone"
 
 ALLOW_EMPTY_${PN} = "1"
 RDEPENDS_${PN} = "${TZ_PACKAGES}"
-- 
2.21.0


