Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1TbCNt-0002EI-Mr
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 16:38:41 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 21 Nov 2012 16:23:32 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id A30A9291437;
	Wed, 21 Nov 2012 16:23:32 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2012 16:23:07 +0100
Message-ID: <1353511391-60570-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 0/4] RFC: ptest for danny
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
X-List-Received-Date: Wed, 21 Nov 2012 15:38:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all.

Here is an update of the "ptest" concept I introduced a few months back.
The idea is to create a new package group called -ptest which contains the
test suites included with many source packages, compiled to run on
target.

A new package, ptest-runnner, contains a simple shell script to find and
run all installed ptests.

Making ptest package recipes present a number of challenges. First, the
task of building and running the tests have to be split in two. Then, the
test files must be installed in the file system in a sane way.

I have included recipe patches for glib-2.0 and dbus here. They solve the
building and running relatively cleanly but the install bit is still a
rather kludgy list of cp and sed lines. I'm working on a more generic
"make ptest-install" solution.

These patches are against the "danny" branch.

Bj=C3=B6rn Stenberg (4):
  Add a new distro feature "ptest"
  New recipe: ptest-runner
  Add ptest for glib-2.0.
  Add ptest for dbus.

 meta/classes/image.bbclass                         |    6 +-
 meta/classes/packagegroup.bbclass                  |    2 +-
 meta/conf/bitbake.conf                             |   15 +++-
 meta/recipes-core/dbus/dbus-1.6.4/run-ptest        |    3 +
 .../dbus/dbus-1.6.4/test-run-path.patch            |   26 ++++++
 meta/recipes-core/dbus/dbus-test_1.6.4.bb          |   84 ++++++++++++++++=
++++
 meta/recipes-core/dbus/dbus.inc                    |    3 +
 .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   30 +++++++
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    3 +
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |   57 +++++++++++++
 .../automake/automake/buildtest.patch              |   33 ++++++++
 meta/recipes-devtools/automake/automake_1.12.3.bb  |    3 +-
 .../ptest-runner/files/ptest-runner                |   19 +++++
 .../ptest-runner/ptest-runner_1.0.bb               |   17 ++++
 14 files changed, 296 insertions(+), 5 deletions(-)
 create mode 100755 meta/recipes-core/dbus/dbus-1.6.4/run-ptest
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch
 create mode 100644 meta/recipes-core/dbus/dbus-test_1.6.4.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patc=
h
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest
 create mode 100644 meta/recipes-devtools/automake/automake/buildtest.patch
 create mode 100644 meta/recipes-support/ptest-runner/files/ptest-runner
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb

--=20
1.7.5.4



