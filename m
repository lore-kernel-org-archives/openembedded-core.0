Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 15BE37F89A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 49A6A9C0476;
	Fri, 17 Jan 2020 11:46:17 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id OXJkNtnUaacQ; Fri, 17 Jan 2020 11:46:16 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 424219C0477;
	Fri, 17 Jan 2020 11:46:16 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id QKudnPndi3RU; Fri, 17 Jan 2020 11:46:16 -0500 (EST)
Received: from sulaco.example.com (40.73.12.109.rev.sfr.net [109.12.73.40])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8F6799C0476;
	Fri, 17 Jan 2020 11:46:14 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 17:45:56 +0100
Message-Id: <20200117164609.28400-1-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v4 00/13] NPM refactoring
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
X-List-Received-Date: Fri, 17 Jan 2020 16:46:16 -0000
Content-Transfer-Encoding: quoted-printable

Hi folks and happy new year,

For readability here is a link if you want the history of this patchset:
http://lists.openembedded.org/pipermail/openembedded-core/2019-December/2=
90298.html

--- V4

The patches can be found here:
https://github.com/savoirfairelinux/openembedded-core/tree/npm-refactorin=
g-v4

 - Two fetchers are available: npm and npmsw

 - The npm fetcher is used to fetch a single package from a registry.

 - The npmsw fetcher is used to fetch the dependencies of a package. It u=
ses a
   npm shrinkwrap file to list the dependencies. The file can be edited
   manually if some dependencies needs to be updated.

 - Both fetcher are independent.

   For example you can have a main package using npm:
     SRC_URI =3D "npm://registry.url;package=3Dfoobar;version=3D1.0.0 \
                npmsw://${THISDIR}/npm-shrinkwrap.json"

   The main package can also be fetched another way without changing anyt=
hing:
     SRC_URI =3D "git://github.com/foo/bar.git;protocol=3Dhttps \
                npmsw://${THISDIR}/npm-shrinkwrap.json"

 - The npm class is in charge of executing the 'npm install'. This instal=
lation
   is executed completely offline. The package sources can be patched saf=
ely
   before the build.

 - The npm class populates a local npm cache during the do_configure task=
. As
   this step can take time the support of a progress bar have been added.

 - The devtool and recipetool scripts have been updated to match the new
   fetchers and class. The licences are handled and split by dependencies=
.

 - Both fetcher, the recipe creation and the recipe build are covered by =
tests.

 - Using devtool I have successfully generated and built recipe for:
   - My test application:
       https://github.com/savoirfairelinux/node-server-example
   - The angular cli which will be used to build angular applications:
       https://cli.angular.io
   - The mozilla iot gateway which is a big project with a lot of depende=
ncies:
       https://github.com/mozilla-iot/gateway
     To build this project you have to manually add this line in the reci=
pe:
       DEPENDS =3D "nanomsg sqlite3 libuv"

Jean-Marie LEMETAYER (13):
  classes/npm: refactor the npm class
  classes/npm: restrict the build to be offline
  classes/npm: use the local node headers
  classes/npm: use the native python
  classes/npm: force to rebuild the prebuild addons
  devtool: npm: rename npm command line options
  recipetool/create_npm: refactor the npm recipe creation handler
  recipetool/create_npm: handle the licenses of the dependencies
  lib/oe/package: remove unneeded npm_split_package_dirs function
  devtool/standard: npm: update the append file
  recipetool/create: npm: remove the 'noverify' url parameter
  oeqa/selftest/recipetool: add npm recipe creation test
  oeqa/selftest/devtool: add npm recipe build test

 meta/classes/npm.bbclass                   | 360 ++++++++++++---
 meta/lib/oe/package.py                     |  33 --
 meta/lib/oeqa/selftest/cases/devtool.py    |  20 +
 meta/lib/oeqa/selftest/cases/recipetool.py |  25 +
 scripts/lib/devtool/standard.py            |  18 +-
 scripts/lib/recipetool/create.py           |  10 +-
 scripts/lib/recipetool/create_npm.py       | 514 +++++++++------------
 7 files changed, 564 insertions(+), 416 deletions(-)

--
2.20.1


