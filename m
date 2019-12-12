Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id E5A6B6C45D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 12:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DF9E19C02B3;
	Thu, 12 Dec 2019 07:49:17 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id cyRYyaaOVB5p; Thu, 12 Dec 2019 07:49:17 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1D8059C0365;
	Thu, 12 Dec 2019 07:49:17 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 0VQ7H8mOjyc5; Thu, 12 Dec 2019 07:49:16 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E6DDA9C02B3;
	Thu, 12 Dec 2019 07:49:16 -0500 (EST)
Date: Thu, 12 Dec 2019 07:49:16 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <1494667065.1274125.1576154956651.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC79 (Linux)/8.8.11_GA_3737)
Thread-Index: qfo+N5N9xMZQyLEvDG6jTDbZpy5Z7A==
Thread-Topic: Status of the NPM refactoring
Cc: rennes@savoirfairelinux.com
Subject: Status of the NPM refactoring
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
X-List-Received-Date: Thu, 12 Dec 2019 12:49:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi folks,

I am currently trying to update/refactor the handling of the NPM packages.

Here is the history of my patchset:

V1:
http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288179.html
http://lists.openembedded.org/pipermail/bitbake-devel/2019-October/020435.html

V2:
http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288352.html
http://lists.openembedded.org/pipermail/bitbake-devel/2019-October/020449.html

V3:
http://lists.openembedded.org/pipermail/openembedded-core/2019-November/289431.html
http://lists.openembedded.org/pipermail/bitbake-devel/2019-November/020532.html

----

I first tried to separate the fetching of a single npm package (with a "npm://"
fetcher) and the fetching of its dependencies (managed in the npm.bbclass
class). The good thing is that the initial package could be fetched by another
fetcher ("git://", "http://" ...) and still get the dependencies by inheriting
the npm class based on a npm-shrinkwrap.json file [1].

1: https://docs.npmjs.com/files/shrinkwrap.json

In the latest version, Richard suggest to create another "npmsw://" fetcher to
get the dependencies. The fetching of the package and its dependencies is still
divided AND the npm class no longer fetches anything, which is much cleaner.

Here is a visual example of what a recipe could be:

    SRC_URI = "npm://registry.npmjs.org;name=my-package;version=${PV} \
               npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json"

    S = "${WORKDIR}/npm"

    inherit npm

----

Thinking about these fetchers I realized that they are in fact "proxy fetchers"
as they just generate new URIs that are already handled by bitbake
(mainly "http://" but also "git://" and "file://").

The first fetcher "npm://" runs the "npm view" command [2] to get the tarball
URI. There is only one URI for this one. The second fetcher have to manage
multiple URIs which are already resolved in the npm-shrinkwrap.json file.

2: https://docs.npmjs.com/cli/view.html

To achieve this I have to correctly configure the localfile / localpath of the
fetch files and manage the donestamp file and the lockfile. I may need to tweak
a little these parts.

----

Another part is about the checksums. To be able to fetch something using
"http://" a checksum must be set (md5 or sha256). On its side NPM provides
shasum (sha1) or integrity (sha256, sha384 or sha512) [3].

3: https://docs.npmjs.com/files/package-lock.json#integrity

For this to work, I intend to add sha1, sha384 and sha512 support for fetchers.
I would like to post these patches before the others because they are not
directly related to NPM.

----

Is it OK ? Any thought ? Any advice ?

Best Regards,

Jean-Marie LEMETAYER
Enthusiast embedded systems engineer
Savoir-faire Linux

