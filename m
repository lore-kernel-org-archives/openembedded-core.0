Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMNMG-0000Jo-7q for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 18:42:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HGdvwH018603;
	Tue, 17 May 2011 17:39:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18371-05; Tue, 17 May 2011 17:39:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HGdpSh018597
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 May 2011 17:39:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <abd335f0e36fe2a96316b77d5e04e00b8ddb4ea9.1305279161.git.dexuan.cui@intel.com>
References: <cover.1305279161.git.dexuan.cui@intel.com>
	<abd335f0e36fe2a96316b77d5e04e00b8ddb4ea9.1305279161.git.dexuan.cui@intel.com>
Date: Tue, 17 May 2011 17:39:50 +0100
Message-ID: <1305650390.3424.267.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC][v2] [PATCH 1/1] package-index.bb: add support for deb and rpm.
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
X-List-Received-Date: Tue, 17 May 2011 16:42:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Dexuan,

When I read Saul's original emails I thought this approach would work
although it wasn't the first one that came to my mind.

Looking at the code you have, the problem is you have nowhere you can
call the "addtask" for the individual tasks and we don't want to the
overhead system wide for every recipe as it makes no sense.

I'd therefore like to suggest we tweak this approach a little. Each
package_xxx.bbclass defines a function which updates the index for that
packaging backend:

package_ipk.bbclass:

PACKAGEINDEXES += "package_index_ipk();"
PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
package_index_ipk[dirs] = "${DEPLOY_DIR_IPK}"

package_index_ipk() {
       set -ex
       package_update_index_ipk
       set +ex
}

The key is the addition to the PACKAGEINDEXES variable and its
dependencies in PACKAGEINDEXDEPS.

In package-index.bb we can then just have:

do_package_index[depends] += "${PACKAGEINDEXDEPS}"
 
do_package_index() {
	${PACKAGEINDEXES}
}

and these variables should always have the things we need in them
depending on the package backends available.

Ideally we should cover the case there is no package backend enabled and
just return too rather than error (or bbwarn "No package backends
enabled, doing nothing").

Cheers,

Richard




