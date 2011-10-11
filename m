Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDai1-00032S-Br for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 13:41:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9BBgG8O010227 for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:42:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id shqqXDgVuwew
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:42:16 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9BBgB7g010222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:42:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2011 12:35:28 +0100
In-Reply-To: <1318279539.23801.68.camel@ted>
References: <1318279539.23801.68.camel@ted>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318332940.23801.90.camel@ted>
Mime-Version: 1.0
Subject: Re: Some further build dependency timings
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
X-List-Received-Date: Tue, 11 Oct 2011 11:41:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-10 at 21:45 +0100, Richard Purdie wrote:
> Just for reference, with a base configuration, sato image:
> 
> real	50m8.223s
> user	298m41.450s
> sys	52m42.200s
> 
> adding:
> 
> ASSUME_PROVIDED =+ "bison-native flex-native sqlite3-native git-native"
> 
> (and hacking the pseudo recipe to use a sqlite3-native):
> 
> real	42m6.740s
> user	296m21.940s
> sys	52m25.220s
> 
> We continue to have real dependency issues around gettext in both the
> native and target builds...

So to continue the story, adding:

DEBUG_FLAGS = ""
INHERIT_INSANE = ""
PACKAGE_CLASSES = "package_ipk"
USER_CLASSES = ""

Results in:

real	38m23.053s
user	237m7.430s
sys	39m3.720s

Then adding PSEUDO_RELOADED=yes to the environment of tasks not needing
pseudo (hack patch below):

real	36m20.683s
user	236m19.580s
sys	37m54.450s

Finally, adding:

DISABLESTATIC = "--disable-static"
DISABLESTATIC_pn-qemu = ""
DISABLESTATIC_pn-qemu-native = ""
DISABLESTATIC_pn-openssl = ""
DISABLESTATIC_pn-openssl-native = ""
EXTRA_OECONF += "${DISABLESTATIC}"

real	34m53.877s
user	233m34.780s
sys	38m50.190s

Cheers,

Richard


--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1096,6 +1096,10 @@ class RunQueueExecute:
 
             logger.debug(2, 'Running %s:%s under fakeroot, fakedirs: %s' %
                             (fn, taskname, ', '.join(fakedirs)))
+        else:
+            envbackup["PSEUDO_RELOADED"] = os.environ.get("PSEUDO_RELOADED")
+            os.environ["PSEUDO_RELOADED"] = "yes"
+            fakeenv["PSEUDO_RELOADED"] = "yes"
 
         sys.stdout.flush()
         sys.stderr.flush()





