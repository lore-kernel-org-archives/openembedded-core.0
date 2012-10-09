Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TLTdo-0004Nr-Ax
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 08:50:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q996ax8G021725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Oct 2012 23:36:59 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 8 Oct 2012 23:36:59 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Oct 2012 14:36:53 +0800
Message-ID: <cover.1349689653.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com
Subject: [PATCH 0/4] ruby: Add from OE-Classic and update to 1.9.3-p194
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 06:50:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* I sent this months ago but was told that oe-core is not the right place,
  however, we think it makes sense to add ruby to complete the scripting
  language set of: python, perl, ruby, so I re-send it.

* Test info
  1) IMAGE_INSTALL_append += "ruby"
  2) $ bitbake core-image-sato
  3) $ runqemu
  4) simple runtime tests: 

root@qemuppc:~# ruby -v
ruby 1.9.3p194 (2012-04-20 revision 35410) [powerpc-linux]

root@qemuppc:~# ruby -e 'puts "Hello World"'
Hello World

root@qemuppc:~# gem -v
1.8.23

root@qemuppc:~# wget http://rubygems.org/downloads/term-ansicolor-1.0.7.gem
Connecting to rubygems.org (204.232.149.25:80)
Connecting to rubygems.org (204.232.149.25:80)
Connecting to production.cf.rubygems.org (54.240.160.224:80)
term-ansicolor-1.0.7 100% |*******************************| 16896   0:00:00 ETA
root@qemuppc:~# ls
term-ansicolor-1.0.7.gem
root@qemuppc:~# gem install term-ansicolor-1.0.7.gem
Successfully installed term-ansicolor-1.0.7
1 gem installed
Installing ri documentation for term-ansicolor-1.0.7...
Installing RDoc documentation for term-ansicolor-1.0.7...
root@qemuppc:~# gem list

*** LOCAL GEMS ***

bigdecimal (1.1.0)
io-console (0.3)
json (1.5.4)
minitest (2.5.1)
rake (0.9.2.2)
rdoc (3.9.4)
term-ansicolor (1.0.7)

 
  

The following changes since commit bcefd015fb163d9c382ae05a86569dbcfd3d736a:

  oe-buildenv-internal: Add BB_NO_NETWORK to BB_ENV_EXTRAWHITE (2012-10-07 13:13:52 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_ruby_20121008_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_ruby_20121008_2

Jackie Huang (4):
  libyaml: Add recipe from meta-oe
  libyaml: update to 0.1.4
  ruby: Add from OE-Classic
  ruby: update to 1.9.3-194

 meta/recipes-devtools/ruby/ruby.inc                |   37 +++
 ...onf-hardcode-wide-getaddr-info-test-outco.patch |   26 ++
 meta/recipes-devtools/ruby/ruby/extmk.patch        |   13 +
 meta/recipes-devtools/ruby/ruby/extmk_run.patch    |   15 +
 .../ruby/ruby/ruby-1.9.3-always-use-i386.patch     |   11 +
 .../ruby/ruby/ruby-1.9.3-bignum-test-fix.patch     |   31 ++
 .../ruby/ruby-1.9.3-custom-rubygems-location.patch |   86 ++++++
 .../ruby/ruby-1.9.3-disable-versioned-paths.patch  |  149 ++++++++++
 .../ruby/ruby/ruby-1.9.3-fix-s390x-build.patch     |   12 +
 .../ruby/ruby/ruby-1.9.3-install-cross.patch       |   16 +
 .../ruby/ruby/ruby-1.9.3-mkmf-verbose.patch        |   11 +
 .../ruby-1.9.3-rubygems-1.8.11-uninstaller.patch   |   76 +++++
 .../ruby/ruby/ruby-1.9.3-webrick-test-fix.patch    |   24 ++
 .../ruby/rubygems-1.8.11-binary-extensions.patch   |  296 ++++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_1.9.3-p194.bb      |   57 ++++
 meta/recipes-support/libyaml/libyaml_0.1.4.bb      |   17 ++
 16 files changed, 877 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby.inc
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/extmk.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/extmk_run.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-fix-s390x-build.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby_1.9.3-p194.bb
 create mode 100644 meta/recipes-support/libyaml/libyaml_0.1.4.bb

-- 
1.7.4



