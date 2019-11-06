Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 62DBE7F877
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3IyL1nbWh1ISHgbX0tNwzF+zQyaatdj3ND/K2ZYOA9Y=;
	b=oLH9Il3po/Lzi09GcoXMqLA8wD
	OOiKvlA4BcRUODp93f9eLVJfoMaQBOL/FGAhE3VJRJluetV9FIBAL3A+X2i2GFE2ngFTlmvY6Jh18
	GRl4fJqrVfBepNNdPyUsAqhzZk0rgRYfz9Z438Tqqv564pldJIlnHI1Tqi6U02Cv+PmqYJCWKvaSK
	KX2RV3WS+fUiF4tUWqr/W+xZclkxhLJgAuP0u4bj8yHG3QlfbAtn5wF6wTvLexQzJ5KB18pI9Dv6v
	yG9jy8y5ePV1Wb7q7jly26L2tjXua3SfieqYAdqd/X3b+teD6iC3vJcdwnd/+IrztvOzS+GEWBgp1
	DnF/heKw==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOG-0008VU-Ge; Wed, 06 Nov 2019 17:38:38 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNNw-0007Nl-BR; Wed, 06 Nov 2019 17:38:16 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:15 +0200
Message-Id: <cover.1573047194.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-Rspam-Score: 3.4 (+++)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: FROM_HAS_DN(0.00)
	Symbol: TO_DN_SOME(0.00) Symbol: R_SPF_ALLOW(-0.20)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: IP_SCORE(-0.19) Symbol: RCPT_COUNT_TWO(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: HFILTER_HOSTNAME_UNKNOWN(2.50)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf allow
	Message-ID: cover.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Bar: +++
X-SA-Exim-Connect-IP: 2001:67c:1be8::12
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_HELO_NONE,SPF_NEUTRAL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:37 -0000

Hi,

Request for comments, call for help, LTS too?

Yocto 2.5 sumo isn't actively maintained by the Yocto Project
anymore. But that does not mean that support for it
needs to stop.

I use sumo and due to various reasons like BSP layers, binary
compatibility, contracts etc can't update to newer release
or to master branch. I suspect I'm not alone.

sumo CVE checking machinery is broken due to changes in
NIST and NVD (see
https://nvd.nist.gov/general/news/XML-Vulnerability-Feed-Retirement and
https://nvd.nist.gov/General/News/JSON-1-1-Vulnerability-Feed-Release )
so some backports from poky master/zeus are needed to fix the
tooling. Thanks to Anuj, Chen, Chin, Pierre, Ross and others
who fixed these on master branch!

The tooling will expose that sumo is severely lacking in security
patches, but the tooling is a start for anyone interested, like me,
to fill the gaps and publish patches for bitbake recipes we care
about.

Could sumo be an LTS? Well I hope so. The LTS proposal
http://lists.openembedded.org/pipermail/openembedded-architecture/2019-October/001665.html
https://docs.google.com/document/d/1AwAFDf52f_FoXksbHEVUMlu4hpcI0JMGVG-Kj_sUkyc/edit
from Yocto Project is great. Maybe as part of that work, someone could
setup a really minimal set of QA on Yocto Project side to also test
patches aiming at yocto 2.5 sumo. If not, would be really nice if
someone could collect patches into sumo-next or sumo-contrib branch where us
users could be in charge of all Quality Assurance.

So, comments and review are welcome. Patches even more so!

Patches were tested on an x86 product tree where full stack CVE
analysis produces good results. Then I ported them to pure poky sumo
and ran core-image-minimal build. Tried running "bitbake world" build
which also succeeds. The results show following bitbake target
recipes from poky with unpatched CVEs (ignored native, SDK and cross
tools for now):

build/tmp/deploy/cve$ grep -l "Unpatched" * | egrep -v -- "-native|nativesdk-|-cross" | sort
apt
aspell
binutils
bluez5
busybox
bzip2
cairo
cups
curl
db
dropbear
elfutils
epiphany
expat
file
gcc
gcc-runtime
gcc-sanitizers
gcc-source-7.3.0
ghostscript
git
glib-2.0
glibc
gnupg
gnutls
go
gstreamer1.0
libarchive
libcomps
libcroco
libexif
libgcc
libgcrypt
libid3tag
libjpeg-turbo
libpcap
libpcre
libpng
librsvg
libsndfile1
libsolv
libvorbis
libx11
libxkbcommon
libxslt
lighttpd
lz4
nasm
ncurses
openssh
openssl
pango
patch
pcmanfm
perl
python
python3
qemu
shadow
sqlite3
sudo
sysstat
systemd
tar
tiff
unzip
webkitgtk
wget
wpa-supplicant
xdg-utils
xserver-xorg
zip

Sampling on the data shows that

 * openssl 1.0.2p is missing patch for CVE-2019-1559
 * openssh 7.6p1 is missing a lot more patches
 * gcc is missing patches for CVE-2018-12886 on ARM
   and CVE-2019-15847 on POWER9
 * libpng is missing patch for CVE-2018-14048
 * libjpeg-turbo is missing patch for CVE-2018-14498
 * libgcrypt is missing patch for CVE-2018-6829
etc.

About CVE checking in yocto:

 * enable with 'INHERIT += "cve-check"' in conf/local.conf
 * see the resulting reports in tmp/deploy/cve/ directory for
   all compiled recipes
 * there is also an image specific summary but I saw it included
   native and nativesdk recipe data too
 * for applying CVE patches, white listing, setting product names
   etc see the meta/classes/cve-check.bbclass and examples in this patchset
   and in master branch
 * note that only recompiled recipes will be analyzed for CVEs
   so things from sstate cache will be ignored, a clean build without
   cache may be needed when enabling the check

ps. sumo still comes with gcc 7.3 and my patch to update to 7.4
with lots of bug fixes has not been applied from
http://lists.openembedded.org/pipermail/openembedded-core/2019-January/278049.html
I've been using gcc 7.4 in several x86 and arm64 projects so I would also
apply this update to any sumo tree out there.

Cheers,

-Mikko

Anuj Mittal (2):
  openssl: set CVE vendor to openssl
  rsync: fix CVEs for included zlib

Chen Qi (9):
  flac: also add flac to CVE_PRODUCT
  xserver-xorg: set CVE_PRODUCT
  nasm: add CVE_PRODUCT
  dropbear: set CVE_PRODUCT
  libsdl: set CVE_PRODUCT
  ghostscript: set CVE_PRODUCT
  squashfs-tools: set CVE_PRODUCT
  libxfont2: set CVE_PRODUCT
  webkitgtk: set CVE_PRODUCT

Chin Huat Ang (1):
  cve-update-db-native: fix https proxy issues

Mikko Rapeli (1):
  cve-check.bbclass: initialize to_append

Pierre Le Magourou (13):
  cve-update-db: New recipe to update CVE database
  cve-check: Remove dependency to cve-check-tool-native
  cve-check: Manage CVE_PRODUCT with more than one name
  cve-check: Consider CVE that affects versions with less than operator
  cve-update-db: Use std library instead of urllib3
  cve-update-db: Manage proxy if needed.
  cve-update-db: do_populate_cve_db depends on do_fetch
  cve-update-db: Catch request.urlopen errors.
  cve-check: Depends on cve-update-db-native
  cve-check: Update unpatched CVE matching
  cve-check: Replace CVE_CHECK_CVE_WHITELIST by CVE_CHECK_WHITELIST
  cve-update-db: Use NVD CPE data to populate PRODUCTS table
  cve-update-db-native: Remove hash column from database.

Ross Burton (21):
  cve-check: be idiomatic
  cve-check: remove redundant readline CVE whitelisting
  cve-check-tool: remove
  glibc: exclude child recipes from CVE scanning
  cve-check: allow comparison of Vendor as well as Product
  cve-update-db-native: use SQL placeholders instead of format strings
  cve-update-db-native: use os.path.join instead of +
  cve-update-db: actually inherit native
  cve-update-db-native: use executemany() to optimise CPE insertion
  cve-update-db-native: improve metadata parsing
  cve-update-db-native: clean up JSON fetching
  cve-check: ensure all known CVEs are in the report
  cve-check: failure to parse versions should be more visible
  flex: set CVE_PRODUCT to include vendor
  libpam: set CVE_PRODUCT
  procps: whitelist CVE-2018-1121
  libpng: whitelist CVE-2019-17371
  ed: set CVE vendor to avoid false positives
  boost: set CVE vendor to Boost
  subversion: set CVE vendor to Apache
  git: set CVE vendor to git-scm

 meta/classes/cve-check.bbclass                     | 147 ++++++++-----
 meta/conf/distro/include/maintainers.inc           |   2 +
 .../recipes-connectivity/openssl/openssl_1.0.2p.bb |   2 +
 .../recipes-connectivity/openssl/openssl_1.1.0i.bb |   2 +
 meta/recipes-core/dropbear/dropbear.inc            |   2 +
 meta/recipes-core/glibc/glibc-locale.inc           |   3 +
 meta/recipes-core/glibc/glibc-mtrace.inc           |   3 +
 meta/recipes-core/glibc/glibc-scripts.inc          |   3 +
 meta/recipes-core/meta/cve-update-db-native.bb     | 190 +++++++++++++++++
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |  62 ------
 ...01-Fix-freeing-memory-allocated-by-sqlite.patch |  50 -----
 ...ow-overriding-default-CA-certificate-file.patch | 215 -------------------
 ...ogress-in-percent-when-downloading-CVE-db.patch | 135 ------------
 ...are-computed-vs-expected-sha256-digit-str.patch |  52 -----
 .../check-for-malloc_trim-before-using-it.patch    |  51 -----
 meta/recipes-devtools/flex/flex_2.6.0.bb           |   3 +
 meta/recipes-devtools/git/git.inc                  |   2 +
 meta/recipes-devtools/nasm/nasm_2.13.03.bb         |   2 +
 .../rsync/files/CVE-2016-9840.patch                |  75 +++++++
 .../rsync/files/CVE-2016-9841.patch                | 228 +++++++++++++++++++++
 .../rsync/files/CVE-2016-9842.patch                |  33 +++
 .../rsync/files/CVE-2016-9843.patch                |  53 +++++
 meta/recipes-devtools/rsync/rsync_3.1.3.bb         |   7 +-
 .../squashfs-tools/squashfs-tools_git.bb           |   2 +
 .../subversion/subversion_1.9.7.bb                 |   2 +
 meta/recipes-extended/ed/ed_1.14.2.bb              |   2 +
 .../ghostscript/ghostscript_9.21.bb                |   3 +
 meta/recipes-extended/pam/libpam_1.3.0.bb          |   2 +
 meta/recipes-extended/procps/procps_3.3.12.bb      |   3 +
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |   2 +
 meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb     |   2 +
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb  |   2 +
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   2 +
 meta/recipes-multimedia/flac/flac_1.3.2.bb         |   2 +-
 meta/recipes-multimedia/libpng/libpng_1.6.34.bb    |   3 +
 meta/recipes-sato/webkit/webkitgtk_2.18.6.bb       |   2 +
 meta/recipes-support/boost/boost.inc               |   2 +
 37 files changed, 731 insertions(+), 622 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb
 delete mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.patch
 delete mode 100644 meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9840.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9841.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9842.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9843.patch

-- 
1.9.1


