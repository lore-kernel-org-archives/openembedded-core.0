Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REgFV-00067R-8J for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 13:48:27 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EBnKgx010725 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:49:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Z8aRrRWpBrlz
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:49:20 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EBnFtU010708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:49:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 12:42:32 +0100
In-Reply-To: <20111014104745.GD4437@ad.chargestorm.se>
References: <20111014075529.GB4437@ad.chargestorm.se>
	<20111014104745.GD4437@ad.chargestorm.se>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318592560.942.3.camel@ted>
Mime-Version: 1.0
Subject: Re: [RFC] Preventing race when compiling external kernel modules
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
X-List-Received-Date: Fri, 14 Oct 2011 11:48:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-14 at 12:47 +0200, Anders Darander wrote:
> * Anders Darander <anders@chargestorm.se> [111014 09:55]:
> > In our local tree, I've circumvented this race by applying a patch like
> > [3]. (Well, we could likely have put the lock in do_make_scripts()
> > instead of module_do_compile(), as we have done currently). Obviously,
> > I'm not proposing to apply this patch, as it depends on lockfile from
> > the procmail-package (host-package).
> 
> Just to confirm, it seems (after a very few tests) that it indeed is
> enough to guard the do_make_scripts() with the lock.
> 
> However, the question on how to make the real solution remains...

I've not tested this but it might give you enough info to test
something:

(Basic idea is to promote that function to a task, then apply a lock to
it).

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 572df0d..5602e74 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -14,8 +14,10 @@ do_make_scripts() {
                   -C ${STAGING_KERNEL_DIR} scripts
 }
 
+addtask make_scripts before compile
+do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+
 module_do_compile() {
-       do_make_scripts
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
                   KERNEL_SRC=${STAGING_KERNEL_DIR}    \


Cheers,

Richard



