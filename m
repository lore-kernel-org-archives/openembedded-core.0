Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SSbsS-00045l-FW
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 00:30:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4AMKX0d020413
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 15:20:33 -0700 (PDT)
Received: from msp-dhcp22.wrs.com (172.25.34.22) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 10 May 2012 15:20:32 -0700
Message-ID: <4FAC3F2F.9000006@windriver.com>
Date: Thu, 10 May 2012 17:20:31 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Wessel, Jason"
	<jason.wessel@windriver.com>
Subject: setscene and perl -- pathological case
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
X-List-Received-Date: Thu, 10 May 2012 22:30:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

We've discovered that perl seems to be a pretty bad pathological case for setscene.

Easy way to see what I mean:

bitbake perl
bitbake -c clean perl
time bitbake perl

The system isn't doing anything but running the setscene elements to bring perl 
from the sstate-cache into the sysroot and related directories.. but it takes a 
very long time to do this:

real    3m7.430s
user    0m36.316s
sys     2m46.742s

That is on my 8 core w/ 12 GB of ram system..  (standard SATA disks)

Digging into this, I found that the majority of the time is spent in 
meta/classes/sstate.bbclass: sstate_installpkg

If you look for the three os.system("sed ...  calls, almost all of the 3 minutes 
is there.  Perl has so many text files with embedded paths that a significant 
amount of time is spent preparing these files and fixing paths.

I did a test and changed the three sed cases into a single sed operation:

-            os.system("sed -i -e s:FIXMESTAGINGDIRTARGET:%s:g %s" % 
(staging_target, sstateinst + file))
-            os.system("sed -i -e s:FIXMESTAGINGDIRHOST:%s:g %s" % 
(staging_host, sstateinst + file))
-            os.system("sed -i -e s:FIXMESTAGINGDIR:%s:g %s" % (staging, 
sstateinst + file))
+            os.system("sed -i -e s:FIXMESTAGINGDIRTARGET:%s:g -e 
s:FIXMESTAGINGDIRHOST:%s:g -e s:FIXMESTAGINGDIR:%s:g %s " % (staging_target, 
staging_host, staging, sstateinst + file))

The result:

real    1m20.979s
user    0m19.400s
sys     1m4.115s

This is a very significant performance improvement.  I'm not sure if it's 
possible to speed this up even more, but it would be nice if we could get things 
under a minute.

Does anyone see a way we could do this quicker or in a better way to boost 
performance?  (One possibility is figure out how to thread the file processing 
and use available processors...)

--Mark


