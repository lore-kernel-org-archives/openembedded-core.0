Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wolfram.stering@hale.at>) id 1RJh0h-0006Tk-5f
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 09:37:51 +0200
Received: from [62.99.145.15] (port=58237 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <wolfram.stering@hale.at>) id 1RJgoy-0007rk-Ed
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 09:25:44 +0200
Received: from [83.64.51.210] (port=3589 helo=gateway1.hale)
	by smartmx-13.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <wolfram.stering@hale.at>)
	id 1RJgov-0000Y5-SJ for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 09:25:41 +0200
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id p9S7Pabf016772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 09:25:36 +0200
Received: from entw42.hale ([192.168.100.73]) by hale.at with MailEnable ESMTP;
	Fri, 28 Oct 2011 09:25:28 +0200
Message-ID: <4EAA58E8.4090702@hale.at>
Date: Fri, 28 Oct 2011 09:25:28 +0200
From: Wolfram Stering <wolfram.stering@hale.at>
Organization: HALE electronic GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Enigmail-Version: 1.1.2
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: p9S7Pabf016772
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: wolfram.stering@hale.at
MailScanner-NULL-Check: 1320391537.85893@5/bVfE1eFk1vhqphkvFqFQ
X-Spam-Status: No
Subject: Problem with buildstats when building on a btrfs volume
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
X-List-Received-Date: Fri, 28 Oct 2011 07:37:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello All,

I've encountered a problem when building (with TMPDIR residing) on a
btrfs volume.

It does not matter what is being built: starting clean, bitbake
discoveres that pseudo needs to be built, it does so successfully but
then gets an exception when doing the buildstats.

ERROR: Execution of event handler 'run_buildstats' failed
Traceback (most recent call last):
  File "run_buildstats(e)", line 18, in run_buildstats(e=<bb.event.BuildStarted object at 0x5e33710>)
  File "buildstats.bbclass", line 21, in set_device(e=<bb.event.BuildStarted object at 0x5e33710>)
UnboundLocalError: local variable 'rdev' referenced before assignment

The problem is related to the fact that btrfs reports a fake device id
by stat(2) in st_dev.
See there for more information:
https://bugzilla.redhat.com/show_bug.cgi?id=711881
http://permalink.gmane.org/gmane.comp.file-systems.btrfs/3509

OE core uses stat on tmpdir to find out the major/minor device ids when
collecting the build statistics, see function set_device in
buildstats.bbclass. If the (fake) device id can't be found in
/proc/diskstats, rdev is never set, but still used two lines later (this
case should be detected and handled gracefully anyhow, IMHO, e.g.
relinquishing buildstats).

I don't know how to reliably solve this problem. /proc/self/mountinfo
can't be used either, as the listed device id there is still different
from what is reported by stat (see the first link above). One possible
solution would be to match on the device name (third field in
/proc/diskstats), but this information is not returned by stat so the
actual mount point needs to be found as prefix of the TMPDIR path, then
symlinks in the device name would need to be resolved as well (which is
common, if LVM and the device mapper are used).

I'm not good at python, otherwise I'd have proposed a patch...

have a nice day,

-wolfi


-- 
Wolfram Stering
 (Entwicklung)
HALE electronic GmbH
Eugen-Müller-Straße 18, 5020 Salzburg, Austria
 Tel: +43 (662) 439011 550
 Fax: +43 (662) 439011 9
http://www.hale.at/
Firmenbuchnummer: FN 66801m HG Salzburg



--
Scanned by MailScanner.



