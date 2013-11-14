Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F29CA6D5BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 13:07:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAED7aP0006894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 05:07:36 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 05:07:36 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Nov 2013 21:07:45 +0800
Message-ID: <cover.1384433183.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Thu, 14 Nov 2013 13:07:36 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This patch checks the validity of TMPDIR.

The TMPDIR must match the following regexp.
^/[a-zA-Z0-9\-_/.~]+$

Detailed tests about why I came up with this regexp are displayed at the end of this cover letter.

A major reason for why TMPDIR cannot support many special chars such as @ and # is that these
special chars are used by the sed command as its field separator in our recipes.

And here are things I want to make sure of.
1. For now, TMPDIR must be an absolute path. So do we need to make it support relative path?
2. I included the tilde (~) into the valid char set because `bitbake world' succeeded. But
   it's still possible the the tilde (~) will serve as the field separator in sed. So is it
   OK that I include it into the valid char set?


**********************  TESTING RECORDS  ****************************************
Test Case 1: use `bitbake minimal' on paths containing special chars
Here's the output.
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/`_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/^_contained"
RESULT: SUCCESS
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/~_contained"
RESULT: SUCCESS
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/<_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/=_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/>_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/|_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/ _contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/,_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/;_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/:_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/!_contained"
RESULT: SUCCESS
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/?_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/'_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/\"_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/(_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/)_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/[_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/]_contained"
RESULT: SUCCESS
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/{_contained"
RESULT: SUCCESS
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/}_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/@_contained"
RESULT: SUCCESS
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/$_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/*_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/\_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/&_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/#_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/%_contained"
RESULT: FAIL
===================
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/+_contained"
RESULT: SUCCESS


Test Case 2: TMPDIR containing ^
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/^_contained"
Command:
    bitbake core-image-minimal -cpopulate_sdk
Result:
    Fail
Formatted Error Message:
    ERROR: Task 5 (virtual:nativesdk:/home/chenqi/poky/meta/recipes-core/eglibc/eglibc_2.18.bb, do_populate_sysroot) failed with exit code '1'
    | checking whether the C compiler works... no
    | configure: error: in `/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/^_contained/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc/2.18-r0/site_config_qemux86':
    | configure: error: C compiler cannot create executables
    | See `config.log' for more details


Test Case 3: TMPDIR containing +
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/+_contained"
Command:
    bitbake world
Result:
    Fail
Formatted Error Message:
    ERROR: Task 9084 (virtual:native:/home/chenqi/poky/meta/recipes-devtools/tcltk/tcl_8.6.1.bb, do_install) failed with exit code '1'
    | oe_libinstall: cd /home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/+_contained/work/i686-linux/tcl-native/8.6.1-r0/build
    | sed: -e expression #1, char 117: unknown option to `s'
Reason:
    '+' is used by the sed command as a separator in tcl recipe.
    sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh


Test Case 4: TMPDIR containing ]
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/]_contained"
Command:
    bitbake world
Result:
    Fail
Formatted Error Message:
    ERROR: Task 5 (virtual:native:/home/chenqi/poky/meta/recipes-graphics/xcb/xcb-proto_1.8.bb, do_configure) failed with exit code '1'
    | configure.ac:9: error: possibly undefined macro: AM_INIT_AUTOMAKE
    |       If this token and others are legitimate, please use m4_pattern_allow.
    |       See the Autoconf documentation.
    | configure.ac:12: error: possibly undefined macro: AM_CONDITIONAL
    | configure.ac:17: error: possibly undefined macro: AM_PATH_PYTHON
    | autoreconf: /home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/]_contained/sysroots/i686-linux/usr/bin/autoconf failed with exit status: 1
    | ERROR: autoreconf execution failed.
    | WARNING: exit code 1 from a shell command.


Test Case 5: TMPDIR containing {
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/[_contained"
Command:
    bitbake world
Result:
    Fail
Formatted Error Message:
    ERROR: Task 9237 (virtual:native:/home/chenqi/poky/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb, do_compile) failed with exit code '1'
    | xsltproc -nonet -o "C/db-label.xml" \
    |      --stringparam basename "db-label" \
    |      --stringparam xsl_file "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/{_contained/work/i686-linux/gnome-doc-utils-native/0.20.10-r0/gnome-doc-utils-0.20.10/doc/xslt/../../xslt/\
docbook/common/db-label.xsl" \
    |      "./xsldoc-docbook.xsl" "C/db-label.xsldoc"
    | db-chunk: No stylesheet param for documented db.chunk.chunks
    | db-common: No named template for documented db.copyright
    | make[2]: *** [C/db-chunk.xml] Error 10


Test Case 6: TMPDIR containing @
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/@_contained"
Command:
    bitbake qt-mobility-x11
Result:
    Fail
Formatted Error Message:
    ERROR: Task 2 (/home/chenqi/poky/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb, do_install) failed with exit code '1'
    | DEBUG: Executing shell function do_install
    | sed: -e expression #1, char 75: unknown option to `s'


Test Case 7: TMPDIR containing ~
TMPDIR = "/home/chenqi/wrlinux-build/directory-names/dir-with-special-chars/[_contained"
Command:
    bitbake world
Result:
   Success

****************************************************************************************

The following changes since commit ea92671d9823e3667d6ced7ac2af20f991da404d:

  bitbake: cooker: replace "w" file opening mode with "a" mode (2013-11-12 17:01:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/TMPDIR
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/TMPDIR

Chen Qi (1):
  sanity.bbclass: check for validity of TMPDIR

 meta/classes/sanity.bbclass |    7 +++++++
 1 file changed, 7 insertions(+)

-- 
1.7.9.5


