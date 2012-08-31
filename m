Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1T7S8b-0001Wh-BP
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 16:23:57 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.298.4;
	Fri, 31 Aug 2012 16:10:36 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id CA7C6286783;
	Fri, 31 Aug 2012 16:10:35 +0200 (CEST)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2012 16:10:26 +0200
Message-ID: <1346422229-61628-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 0/3] RFC: Package testing
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
X-List-Received-Date: Fri, 31 Aug 2012 14:23:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(An earlier version of this was posted to the yocto list last week:
https://lists.yoctoproject.org/pipermail/yocto/2012-August/011166.html)

This is a first set of patches implementing the package testing concept
I proposed in
https://lists.yoctoproject.org/pipermail/yocto/2012-June/009443.html

In summary, the proposal creates a new package group called -ptest that
contains the test suites included with many source packages, compiled to
run on target.

Packaging the test suites sometimes requires patching makefiles to allow
test tools to be cross-compiled. And it sometimes requires patching
and/or translation of the test output to produce a generic output format
that can be automatically parsed. I have included an example patch for
bash that does just that.

I have also included "ptest-runnner", a simple script to find and run
all installed ptests.

The idea is to eventually upstream these changes, both for the benefit
of the entire ecosystem and of course to reduce the number of patches.

However I won't downplay the effort required to get hundreds of upstream
projects to agree on a common concept for test cross compilation and
result formatting.

I see two main options: Implement first or discuss first.

a) Implement first: We design and implement a good system for yocto/oe
and then, once it has proven itself, engage the larger open source
community with our already tested concept.

Pro: It's easier to discuss an already working system
Con: We'll have to manage patches for all packages until agreement

b) Discuss first: We invite the whole open source community to discuss
and try to agree on how to handle cross-compiled test cases and test
result formatting before we implement anything.

Pro: No increased patch load until agreement
Con: No result until agreement, which could potentially take a long time

My suggestion is a). I'm open for all suggestions that would make the
patch load easier to manage.

Bj=C3=B6rn Stenberg (3):
  Add -ptest package group
  Enable bash-ptest
  New recipe: ptest-runner

 meta/classes/distutils-common-base.bbclass         |    5 ++-
 meta/classes/image.bbclass                         |    6 ++-
 meta/classes/task.bbclass                          |    2 +-
 meta/conf/bitbake.conf                             |   12 ++++++-
 .../bash/bash-4.2/build-tests.patch                |   34 ++++++++++++++++=
++++
 meta/recipes-extended/bash/bash-4.2/run-ptest      |    2 +
 .../bash/bash-4.2/test-output.patch                |   19 +++++++++++
 meta/recipes-extended/bash/bash.inc                |   23 +++++++++++++
 meta/recipes-extended/bash/bash_4.2.bb             |    5 ++-
 .../ptest-runner/files/ptest-runner                |   16 +++++++++
 .../ptest-runner/ptest-runner_1.0.bb               |   17 ++++++++++
 11 files changed, 135 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/bash/bash-4.2/build-tests.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/run-ptest
 create mode 100644 meta/recipes-extended/bash/bash-4.2/test-output.patch
 create mode 100644 meta/recipes-support/ptest-runner/files/ptest-runner
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb

--=20
1.7.5.4



