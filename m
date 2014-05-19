Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 528 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 May 2014 08:23:46 UTC
Received: from bes.se.axis.com (unknown [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 12B4065D0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 08:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C5FDA2E39A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 10:14:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id RtmbYY5tVQFX
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 10:14:51 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 3A1EA2E38F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 10:14:51 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 1B79DCDA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 10:14:51 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 105D5B5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 10:14:51 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 0E9DD3E048
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 10:14:51 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail2.se.axis.com
	([10.0.5.74]) with mapi; Mon, 19 May 2014 10:14:50 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 10:14:49 +0200
Thread-Topic: Using users/groups from another recipe than the one creating them
Thread-Index: Ac9zOmJt3ZaNgmRpT1y92nz2xUwFjQ==
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7A7A1D9B648@xmail3.se.axis.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Using users/groups from another recipe than the one creating them
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
X-List-Received-Date: Mon, 19 May 2014 08:23:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Which assumption is correct: "a recipe A that depends on another=20
recipe B can use users/groups that B creates" or "all recipes must=20
create the users/groups they require themselves"?

The problem for us is that we have a lot of recipes that create=20
users and groups, and subsequently a number of other related recipes=20
that need to use those users and groups.=20

If the first assumption is correct then the useradd.bbclass needs to=20
be corrected so that it adds a dependency from do_install to=20
base-passwd:do_populate_sysroot and=20
base-passwd:do_populate_sysroot_setscene, because if either of those=20
tasks execute they will overwrite /etc/passwd and /etc/group,=20
effectively removing any users/groups that were created earlier...

On the other hand, if it is the second assumption that is correct,=20
then there should be QA tests in place to make sure all recipes=20
create the users/groups they use.

//Peter


