Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QPNag-0007AM-8W
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 01:34:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 May 2011 16:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,270,1304319600"; 
   d="scan'208";a="7713646"
Received: from unknown (HELO [10.255.12.84]) ([10.255.12.84])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2011 16:30:02 -0700
Message-ID: <4DDD90F9.5030901@intel.com>
Date: Wed, 25 May 2011 16:30:01 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/5] license.bbclass parsing changes and common-license additions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2011 23:34:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This pull request is a consolidated pull of some changes to the license.bbclass
license parsing, some cleanup of existing licenses, and some additions to/
modifications of various licenses kept in meta/files/common-licenses.

I've modified the common-licenses by adding licenses from the Software Package
and Data Exchange group/OSI and using their naming convention for internal
parsing within license.bbclass.

Licenses were retrieved from http://spdx.org/licenses/ or
in cases where text of the license was missing:
http://opensource.linux-mirror.org/licenses/

I've also modified some recipe's LICENSE field, either because the field was
unparsable or the LICENSE was factually incorrect. This was not an entire audit
of every LICENSE field but there were some errors that were obvious.

And lastly, using python abstract syntax trees as a parser and an ast visitor
class, I've begun the first steps to being able to put some sanity to license
selection.

One note. License modifiers have traditionally been limited to the "or greater"
modifier "+". I've added another modifier "with exceptions" for licenses that
have no generic ie common-licenses/GPL-2,0-with-GCC-exception

The modifiers are ignored for now, but I'll be looking at the logic for them
next.

One side note. The listserve seems to limit mail size, so some of these PATCH
requests may get slammed to /dev/null.

The following changes since commit 5d56586a00350f2ec90a7143182a3f1294fb4c73:

   binutils: Add missing dependency on zlib-native (2011-05-25 23:53:47 +0100)

are available in the git repository at:
   git://git.pokylinux.org/poky-contrib eflanagan/common-licenses
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/common-licenses

Beth Flanagan (5):
   common-licenses: Adding new licenses and renaming
   license.bbclass: Sane Parsing of licenses
   License Field Cleanup: Non-standard field names
   license.bbclass: Fixing X-MIT SPDX license mapping
   license.bbclass: Fixing LICENSE modifiers.

  meta/classes/license.bbclass                       |  155 ++++--
  meta/files/common-licenses/AAL                     |   49 ++
  meta/files/common-licenses/AFL-1                   |   92 +++
  meta/files/common-licenses/AFL-2                   |  155 +++++
  meta/files/common-licenses/AGPL-3                  |  213 ++++++
  meta/files/common-licenses/APL-1                   |  327 ++++++++++
  meta/files/common-licenses/APSL-1                  |  334 ++++++++++
  meta/files/common-licenses/APSL-2                  |  337 ++++++++++
  meta/files/common-licenses/Apache-1                |   59 ++
  meta/files/common-licenses/Apache-2                |  203 ++++++
  meta/files/common-licenses/Artistic-1              |   97 +++
  meta/files/common-licenses/Artistic-2              |  202 ++++++
  meta/files/common-licenses/BSD-2-Clause            |   27 +
  meta/files/common-licenses/BSD-3-Clause            |   25 +
  meta/files/common-licenses/BSD-4-Clause            |   28 +
  meta/files/common-licenses/BSL-1                   |   25 +
  meta/files/common-licenses/CATOSL-1                |  335 ++++++++++
  meta/files/common-licenses/CC-BY-1                 |  185 ++++++
  meta/files/common-licenses/CC-BY-2                 |  205 ++++++
  meta/files/common-licenses/CC-BY-3                 |  283 ++++++++
  meta/files/common-licenses/CC-BY-NC-1              |  194 ++++++
  meta/files/common-licenses/CC-BY-NC-2              |  220 +++++++
  meta/files/common-licenses/CC-BY-NC-3              |  297 +++++++++
  meta/files/common-licenses/CC-BY-NC-ND-1           |  146 +++++
  meta/files/common-licenses/CC-BY-NC-ND-2           |  209 ++++++
  meta/files/common-licenses/CC-BY-NC-ND-3           |  272 ++++++++
  meta/files/common-licenses/CC-BY-NC-SA-1           |  209 ++++++
  meta/files/common-licenses/CC-BY-NC-SA-2           |  242 +++++++
  meta/files/common-licenses/CC-BY-NC-SA-3           |  320 +++++++++
  meta/files/common-licenses/CC-BY-ND-2              |  194 ++++++
  meta/files/common-licenses/CC-BY-ND-3              |  259 ++++++++
  meta/files/common-licenses/CC-BY-SA-1              |  201 ++++++
  meta/files/common-licenses/CC-BY-SA-2              |  227 +++++++
  meta/files/common-licenses/CC-BY-SA-3              |  319 +++++++++
  meta/files/common-licenses/CDDL-1                  |  313 +++++++++
  meta/files/common-licenses/CECILL-1                |  462 +++++++++++++
  meta/files/common-licenses/CECILL-2                |  451 +++++++++++++
  meta/files/common-licenses/CECILL-B                |  465 ++++++++++++++
  meta/files/common-licenses/CECILL-C                |  466 ++++++++++++++
  meta/files/common-licenses/CPAL-1                  |  435 +++++++++++++
  meta/files/common-licenses/CPL-1                   |  250 ++++++++
  meta/files/common-licenses/CUA-OPL-1               |  482 ++++++++++++++
  meta/files/common-licenses/ClArtistic              |  144 +++++
  meta/files/common-licenses/ECL-1                   |   61 ++
  meta/files/common-licenses/ECL-2                   |  218 +++++++
  meta/files/common-licenses/EFL-1                   |   30 +
  meta/files/common-licenses/EFL-2                   |   27 +
  meta/files/common-licenses/EPL-1                   |  204 ++++++
  meta/files/common-licenses/EUDatagrid              |   70 ++
  meta/files/common-licenses/EUPL-1                  |  302 +++++++++
  meta/files/common-licenses/Entessa                 |   48 ++
  meta/files/common-licenses/ErlPL-1                 |  293 +++++++++
  meta/files/common-licenses/Fair                    |   18 +
  meta/files/common-licenses/Frameworx-1             |  181 ++++++
  meta/files/common-licenses/{GFDL => GFDL-1.1}      |  128 ++---
  meta/files/common-licenses/GPL                     |  676 --------------------
  meta/files/common-licenses/GPL-1                   |  259 ++++++++
  meta/files/common-licenses/GPL-2                   |   23 +
  .../common-licenses/GPL-2,0-with-GCC-exception     |   17 +
  .../common-licenses/GPL-2,0-with-font-exception    |   18 +
  .../common-licenses/GPL-2-with-bison-exception     |   20 +
  meta/files/common-licenses/GPL-3                   |   70 ++
  meta/files/common-licenses/GPLv2                   |  339 ----------
  meta/files/common-licenses/GPLv3                   |  676 --------------------
  meta/files/common-licenses/HPND                    |   30 +
  meta/files/common-licenses/IPA                     |  197 ++++++
  meta/files/common-licenses/IPL-1                   |  222 +++++++
  meta/files/common-licenses/ISC                     |   23 +
  meta/files/common-licenses/LGPL                    |  165 -----
  meta/files/common-licenses/LGPL-2                  |  461 +++++++++++++
  meta/files/common-licenses/{LGPLv2.1 => LGPL-2.1}  |    4 +-
  meta/files/common-licenses/LGPL-3                  |  147 +++++
  meta/files/common-licenses/LGPLv2                  |  481 --------------
  meta/files/common-licenses/LGPLv3                  |  165 -----
  meta/files/common-licenses/LPL-1                   |  213 ++++++
  meta/files/common-licenses/LPPL-1                  |  422 ++++++++++++
  meta/files/common-licenses/Libpng                  |  121 ++++
  meta/files/common-licenses/MIT                     |   32 +-
  meta/files/common-licenses/MPL-1                   |  433 +++++++++++++
  meta/files/common-licenses/MS-PL                   |   55 ++
  meta/files/common-licenses/MS-RL                   |   62 ++
  meta/files/common-licenses/MirOS                   |   63 ++
  meta/files/common-licenses/Motosoto                |  434 +++++++++++++
  meta/files/common-licenses/Multics                 |   46 ++
  meta/files/common-licenses/NASA-1                  |  246 +++++++
  meta/files/common-licenses/NCSA                    |   40 ++
  meta/files/common-licenses/NGPL                    |  102 +++
  meta/files/common-licenses/NPOSL-3                 |  206 ++++++
  meta/files/common-licenses/NTP                     |   20 +
  meta/files/common-licenses/Nauman                  |   55 ++
  meta/files/common-licenses/Nokia                   |  434 +++++++++++++
  meta/files/common-licenses/OCLC-2                  |  207 ++++++
  meta/files/common-licenses/OFL-1                   |   96 +++
  meta/files/common-licenses/OGTSL                   |  125 ++++
  meta/files/common-licenses/OLDAP-2                 |   54 ++
  meta/files/common-licenses/OSL-1                   |  172 +++++
  meta/files/common-licenses/OSL-2                   |  171 +++++
  meta/files/common-licenses/OSL-3                   |  157 +++++
  meta/files/common-licenses/OpenSSL                 |  123 ++++
  meta/files/common-licenses/PD                      |    1 +
  meta/files/common-licenses/PHP-3                   |   70 ++
  meta/files/common-licenses/PostgreSQL              |   30 +
  meta/files/common-licenses/Python-2                |  192 ++++++
  meta/files/common-licenses/QPL-1                   |   96 +++
  meta/files/common-licenses/RHeCos-1                |  401 ++++++++++++
  meta/files/common-licenses/RPL-1                   |  582 +++++++++++++++++
  meta/files/common-licenses/RPSL-1                  |  535 ++++++++++++++++
  meta/files/common-licenses/RSCPL                   |  442 +++++++++++++
  meta/files/common-licenses/Ruby                    |   64 ++
  meta/files/common-licenses/SPL                     |  519 +++++++++++++++
  meta/files/common-licenses/Simple-2                |   53 ++
  meta/files/common-licenses/Sleepycat               |   95 +++
  meta/files/common-licenses/SugarCRM-1              |  431 +++++++++++++
  meta/files/common-licenses/VSL-1                   |   54 ++
  meta/files/common-licenses/W3C                     |   50 ++
  meta/files/common-licenses/WXwindows               |   59 ++
  meta/files/common-licenses/Watcom-1                |  389 +++++++++++
  meta/files/common-licenses/XFree86-1               |   50 ++
  meta/files/common-licenses/Xnet                    |   34 +
  meta/files/common-licenses/YPL-1                   |  140 ++++
  meta/files/common-licenses/ZPL-1                   |   60 ++
  meta/files/common-licenses/ZPL-2                   |   44 ++
  meta/files/common-licenses/Zimbra-1                |  140 ++++
  meta/files/common-licenses/Zlib                    |   25 +
  meta/files/common-licenses/eCos-2                  |   38 ++
  meta/files/common-licenses/gSOAP-1                 |  380 +++++++++++
  meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    2 +-
  meta/recipes-core/dbus/dbus-glib.inc               |    2 +-
  meta/recipes-core/dbus/dbus.inc                    |    2 +-
  meta/recipes-core/glib-2.0/glib.inc                |    2 +-
  meta/recipes-core/zlib/zlib_1.2.5.bb               |    2 +-
  meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    2 +-
  meta/recipes-devtools/nasm/nasm_2.07.bb            |    2 +-
  .../python/python-pycairo_1.8.10.bb                |    2 +-
  meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    2 +-
  .../subversion/subversion_1.6.15.bb                |    2 +-
  meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    2 +-
  meta/recipes-devtools/valgrind/valgrind_3.6.1.bb   |    2 +-
  meta/recipes-extended/byacc/byacc.inc              |    2 +-
  meta/recipes-extended/cronie/cronie_1.4.7.bb       |    2 +-
  meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb   |    2 +-
  meta/recipes-extended/mktemp/mktemp_1.7.bb         |    2 +-
  .../recipes-extended/tzcode/tzcode-native_2009r.bb |    2 +-
  meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 +-
  meta/recipes-graphics/cairo/cairo.inc              |    2 +-
  .../fontconfig/fontconfig_2.8.0.bb                 |    2 +-
  meta/recipes-graphics/fstests/fstests_svn.bb       |    2 +-
  .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    2 +-
  meta/recipes-graphics/xorg-font/encodings_1.0.4.bb |    2 +-
  .../xorg-font/xorg-minimal-fonts.bb                |    2 +-
  meta/recipes-graphics/xorg-lib/libxpm_3.5.9.bb     |    2 +-
  meta/recipes-graphics/xorg-lib/pixman_0.20.2.bb    |    2 +-
  meta/recipes-multimedia/libpng/libpng_1.2.44.bb    |    2 +-
  .../pulseaudio/libatomics-ops_1.2.bb               |    2 +-
  meta/recipes-sato/libical/libical_0.46.bb          |    2 +-
  meta/recipes-support/apr/apr-util_1.3.10.bb        |    2 +-
  meta/recipes-support/apr/apr_1.4.2.bb              |    2 +-
  meta/recipes-support/boost/boost-36.inc            |    2 +-
  meta/recipes-support/boost/boost-jam-native.inc    |    2 +-
  meta/recipes-support/boost/boost_1.44.0.bb         |    2 +-
  meta/recipes-support/db/db_5.1.19.bb               |    2 +-
  meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    2 +-
  meta/recipes-support/libgdbus/libgdbus_git.bb      |    2 +-
  meta/recipes-support/taglib/taglib_1.6.3.bb        |    2 +-
  164 files changed, 22150 insertions(+), 2675 deletions(-)
  create mode 100644 meta/files/common-licenses/AAL
  create mode 100644 meta/files/common-licenses/AFL-1
  create mode 100644 meta/files/common-licenses/AFL-2
  create mode 100644 meta/files/common-licenses/AGPL-3
  create mode 100644 meta/files/common-licenses/APL-1
  create mode 100644 meta/files/common-licenses/APSL-1
  create mode 100644 meta/files/common-licenses/APSL-2
  create mode 100644 meta/files/common-licenses/Apache-1
  create mode 100644 meta/files/common-licenses/Apache-2
  create mode 100644 meta/files/common-licenses/Artistic-1
  create mode 100644 meta/files/common-licenses/Artistic-2
  create mode 100644 meta/files/common-licenses/BSD-2-Clause
  create mode 100644 meta/files/common-licenses/BSD-3-Clause
  create mode 100644 meta/files/common-licenses/BSD-4-Clause
  create mode 100644 meta/files/common-licenses/BSL-1
  create mode 100644 meta/files/common-licenses/CATOSL-1
  create mode 100644 meta/files/common-licenses/CC-BY-1
  create mode 100644 meta/files/common-licenses/CC-BY-2
  create mode 100644 meta/files/common-licenses/CC-BY-3
  create mode 100644 meta/files/common-licenses/CC-BY-NC-1
  create mode 100644 meta/files/common-licenses/CC-BY-NC-2
  create mode 100644 meta/files/common-licenses/CC-BY-NC-3
  create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-1
  create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-2
  create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-3
  create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-1
  create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2
  create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-3
  create mode 100644 meta/files/common-licenses/CC-BY-ND-1
  create mode 100644 meta/files/common-licenses/CC-BY-ND-2
  create mode 100644 meta/files/common-licenses/CC-BY-ND-3
  create mode 100644 meta/files/common-licenses/CC-BY-SA-1
  create mode 100644 meta/files/common-licenses/CC-BY-SA-2
  create mode 100644 meta/files/common-licenses/CC-BY-SA-3
  create mode 100644 meta/files/common-licenses/CDDL-1
  create mode 100644 meta/files/common-licenses/CECILL-1
  create mode 100644 meta/files/common-licenses/CECILL-2
  create mode 100644 meta/files/common-licenses/CECILL-B
  create mode 100644 meta/files/common-licenses/CECILL-C
  create mode 100644 meta/files/common-licenses/CPAL-1
  create mode 100644 meta/files/common-licenses/CPL-1
  create mode 100644 meta/files/common-licenses/CUA-OPL-1
  create mode 100644 meta/files/common-licenses/ClArtistic
  create mode 100644 meta/files/common-licenses/ECL-1
  create mode 100644 meta/files/common-licenses/ECL-2
  create mode 100644 meta/files/common-licenses/EFL-1
  create mode 100644 meta/files/common-licenses/EFL-2
  create mode 100644 meta/files/common-licenses/EPL-1
  create mode 100644 meta/files/common-licenses/EUDatagrid
  create mode 100644 meta/files/common-licenses/EUPL-1
  create mode 100644 meta/files/common-licenses/Entessa
  create mode 100644 meta/files/common-licenses/ErlPL-1
  create mode 100644 meta/files/common-licenses/Fair
  create mode 100644 meta/files/common-licenses/Frameworx-1
  rename meta/files/common-licenses/{GFDL => GFDL-1.1} (80%)
  delete mode 100644 meta/files/common-licenses/GPL
  create mode 100644 meta/files/common-licenses/GPL-1
  create mode 100644 meta/files/common-licenses/GPL-2
  create mode 100644 meta/files/common-licenses/GPL-2,0-with-GCC-exception
  create mode 100644 meta/files/common-licenses/GPL-2,0-with-font-exception
  create mode 100644 meta/files/common-licenses/GPL-2-with-bison-exception
  create mode 100644 meta/files/common-licenses/GPL-3
  delete mode 100644 meta/files/common-licenses/GPLv2
  delete mode 100644 meta/files/common-licenses/GPLv3
  create mode 100644 meta/files/common-licenses/HPND
  create mode 100644 meta/files/common-licenses/IPA
  create mode 100644 meta/files/common-licenses/IPL-1
  create mode 100644 meta/files/common-licenses/ISC
  delete mode 100644 meta/files/common-licenses/LGPL
  create mode 100644 meta/files/common-licenses/LGPL-2
  rename meta/files/common-licenses/{LGPLv2.1 => LGPL-2.1} (99%)
  create mode 100644 meta/files/common-licenses/LGPL-3
  delete mode 100644 meta/files/common-licenses/LGPLv2
  delete mode 100644 meta/files/common-licenses/LGPLv3
  create mode 100644 meta/files/common-licenses/LPL-1
  create mode 100644 meta/files/common-licenses/LPPL-1
  create mode 100644 meta/files/common-licenses/Libpng
  create mode 100644 meta/files/common-licenses/MPL-1
  create mode 100644 meta/files/common-licenses/MS-PL
  create mode 100644 meta/files/common-licenses/MS-RL
  create mode 100644 meta/files/common-licenses/MirOS
  create mode 100644 meta/files/common-licenses/Motosoto
  create mode 100644 meta/files/common-licenses/Multics
  create mode 100644 meta/files/common-licenses/NASA-1
  create mode 100644 meta/files/common-licenses/NCSA
  create mode 100644 meta/files/common-licenses/NGPL
  create mode 100644 meta/files/common-licenses/NPOSL-3
  create mode 100644 meta/files/common-licenses/NTP
  create mode 100644 meta/files/common-licenses/Nauman
  create mode 100644 meta/files/common-licenses/Nokia
  create mode 100644 meta/files/common-licenses/OCLC-2
  create mode 100644 meta/files/common-licenses/OFL-1
  create mode 100644 meta/files/common-licenses/OGTSL
  create mode 100644 meta/files/common-licenses/OLDAP-2
  create mode 100644 meta/files/common-licenses/OSL-1
  create mode 100644 meta/files/common-licenses/OSL-2
  create mode 100644 meta/files/common-licenses/OSL-3
  create mode 100644 meta/files/common-licenses/OpenSSL
  create mode 100644 meta/files/common-licenses/PD
  create mode 100644 meta/files/common-licenses/PHP-3
  create mode 100644 meta/files/common-licenses/PostgreSQL
  create mode 100644 meta/files/common-licenses/Python-2
  create mode 100644 meta/files/common-licenses/QPL-1
  create mode 100644 meta/files/common-licenses/RHeCos-1
  create mode 100644 meta/files/common-licenses/RPL-1
  create mode 100644 meta/files/common-licenses/RPSL-1
  create mode 100644 meta/files/common-licenses/RSCPL
  create mode 100644 meta/files/common-licenses/Ruby
  create mode 100644 meta/files/common-licenses/SPL
  create mode 100644 meta/files/common-licenses/Simple-2
  create mode 100644 meta/files/common-licenses/Sleepycat
  create mode 100644 meta/files/common-licenses/SugarCRM-1
  create mode 100644 meta/files/common-licenses/VSL-1
  create mode 100644 meta/files/common-licenses/W3C
  create mode 100644 meta/files/common-licenses/WXwindows
  create mode 100644 meta/files/common-licenses/Watcom-1
  create mode 100644 meta/files/common-licenses/XFree86-1
  create mode 100644 meta/files/common-licenses/Xnet
  create mode 100644 meta/files/common-licenses/YPL-1
  create mode 100644 meta/files/common-licenses/ZPL-1
  create mode 100644 meta/files/common-licenses/ZPL-2
  create mode 100644 meta/files/common-licenses/Zimbra-1
  create mode 100644 meta/files/common-licenses/Zlib
  create mode 100644 meta/files/common-licenses/eCos-2
  create mode 100644 meta/files/common-licenses/gSOAP-1


