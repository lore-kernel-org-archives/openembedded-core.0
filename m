Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 235EE6FCA3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 05:53:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6H5rLV4003916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jul 2014 22:53:21 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 16 Jul 2014 22:53:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 13:53:08 +0800
Message-ID: <cover.1405575611.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/2]rewrite eglibc-utils/usr/bin/tzselect as a posix sh and let it work
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
X-List-Received-Date: Thu, 17 Jul 2014 05:53:26 -0000
Content-Type: text/plain

[YOCTO #6544]

Test Steps:

1. Vim local.conf
The tzdata supplyed timezone info.
...
MACHINE ?= "qemuarm"
IMAGE_FEATURES += "ssh-server-dropbear"
IMAGE_INSTALL_append = " tzcode tzdata"
...

2. bitbake core-image-minimal

3. start qemu and ssh target

4. Use busybox as default shell(bash not installed any more)
root@qemuarm:~# ls /bin/sh -al
lrwxrwxrwx    1 root     root            19 Jul 17 03:45 /bin/sh -> /bin/busybox.nosuid

5. Use busybox's awk by default
root@qemuarm:~# which awk
/usr/bin/awk
root@qemuarm:~# ls -al /usr/bin/awk
lrwxrwxrwx    1 root     root            19 Jul 17 03:45 /usr/bin/awk -> /bin/busybox.nosuid

6. test case 1: set timezone directly
...
root@qemuarm:~# tzselect -c +4852+00220
Please identify a location so that time zone rules can be set correctly.
Please select one of the following time zone regions,
listed roughly in increasing order of distance from +4852+00220.
 1) France
 2) Belgium
 3) Luxembourg
 4) Jersey
 5) Britain (UK)
 6) Guernsey
 7) Netherlands
 8) Germany - Busingen
 9) Switzerland
10) Liechtenstein
#? 1

The following information has been given:

	coord +4852+00220
	France

Therefore TZ='Europe/Paris' will be used.
Local time is now:	Wed Jul 16 13:42:29 CEST 2014.
Universal Time is now:	Wed Jul 16 11:42:29 UTC 2014.
Is the above information OK?
1) Yes
2) No
#? 
1) Yes
2) No
#? 1

You can make this change permanent for yourself by appending the line
	TZ='Europe/Paris'; export TZ
to the file '.profile' in your home directory; then log out and log in again.

Here is that TZ value again, this time on standard output so that you
can use the /usr/bin/tzselect command in shell scripts:
Europe/Paris
....

7. test case 2: set timezone interactively
...
root@qemuarm:~# tzselect 
Please identify a location so that time zone rules can be set correctly.
Please select a continent, ocean, "coord", or "TZ".
 1) Africa
 2) Americas
 3) Antarctica
 4) Arctic Ocean
 5) Asia
 6) Atlantic Ocean
 7) Australia
 8) Europe
 9) Indian Ocean
10) Pacific Ocean
11) coord - I want to use geographical coordinates.
12) TZ - I want to specify the time zone using the Posix TZ format.
#? 2
Please select a country whose clocks agree with yours.
 1) Anguilla
 2) Antigua & Barbuda
 3) Argentina
 4) Aruba
 5) Bahamas
 6) Barbados
 7) Belize
 8) Bolivia
 9) Brazil
10) Canada
11) Caribbean Netherlands
12) Cayman Islands
13) Chile
14) Colombia
15) Costa Rica
16) Cuba
17) Curacao
18) Dominica
19) Dominican Republic
20) Ecuador
21) El Salvador
22) French Guiana
23) Greenland
24) Grenada
25) Guadeloupe
26) Guatemala
27) Guyana
28) Haiti
29) Honduras
30) Jamaica
31) Martinique
32) Mexico
33) Montserrat
34) Nicaragua
35) Panama
36) Paraguay
37) Peru
38) Puerto Rico
39) St Barthelemy
40) St Kitts & Nevis
41) St Lucia
42) St Maarten (Dutch part)
43) St Martin (French part)
44) St Pierre & Miquelon
45) St Vincent
46) Suriname
47) Trinidad & Tobago
48) Turks & Caicos Is
49) United States
50) Uruguay
51) Venezuela
52) Virgin Islands (UK)
53) Virgin Islands (US)
#? 49
Please select one of the following time zone regions.
 1) Eastern Time
 2) Eastern Time - Michigan - most locations
 3) Eastern Time - Kentucky - Louisville area
 4) Eastern Time - Kentucky - Wayne County
 5) Eastern Time - Indiana - most locations
 6) Eastern Time - Indiana - Daviess, Dubois, Knox & Martin Counties
 7) Eastern Time - Indiana - Pulaski County
 8) Eastern Time - Indiana - Crawford County
 9) Eastern Time - Indiana - Pike County
10) Eastern Time - Indiana - Switzerland County
11) Central Time
12) Central Time - Indiana - Perry County
13) Central Time - Indiana - Starke County
14) Central Time - Michigan - Dickinson, Gogebic, Iron & Menominee Counties
15) Central Time - North Dakota - Oliver County
16) Central Time - North Dakota - Morton County (except Mandan area)
17) Central Time - North Dakota - Mercer County
18) Mountain Time
19) Mountain Time - south Idaho & east Oregon
20) Mountain Standard Time - Arizona (except Navajo)
21) Pacific Time
22) Alaska Time
23) Alaska Time - Alaska panhandle
24) Alaska Time - southeast Alaska panhandle
25) Alaska Time - Alaska panhandle neck
26) Alaska Time - west Alaska
27) Aleutian Islands
28) Metlakatla Time - Annette Island
29) Hawaii
#? 1

The following information has been given:

	United States
	Eastern Time

Therefore TZ='America/New_York' will be used.
Local time is now:	Thu Jul 17 00:33:16 EDT 2014.
Universal Time is now:	Thu Jul 17 04:33:16 UTC 2014.
Is the above information OK?
1) Yes
2) No
#? 1

You can make this change permanent for yourself by appending the line
	TZ='America/New_York'; export TZ
to the file '.profile' in your home directory; then log out and log in again.

Here is that TZ value again, this time on standard output so that you
can use the /usr/bin/tzselect command in shell scripts:
America/New_York
...

//Hongxu


The following changes since commit 1dcdd877c7946be4c0b1203deb14e2f842f9d0c2:

  bitbake: toasterui: fix build - project identification (2014-07-14 14:10:03 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-eglibc-tzselect
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-eglibc-tzselect

Hongxu Jia (2):
  busybox: enable CONFIG_FEATURE_AWK_LIBM by default
  eglibc: rewritten tzselect as posix sh and move it to tzcode package

 meta/recipes-core/busybox/busybox/defconfig        |  2 +-
 .../timezone-re-written-tzselect-as-posix-sh.patch | 40 ++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc        |  6 ++--
 meta/recipes-core/eglibc/eglibc_2.19.bb            |  1 +
 4 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/timezone-re-written-tzselect-as-posix-sh.patch

-- 
1.8.1.2


