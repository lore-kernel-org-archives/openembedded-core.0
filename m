Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1RdeS6-0007N7-Hl
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:56:39 +0100
Received: from [62.99.145.2] (port=10823 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1RdeLD-0005zO-Bq
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:49:31 +0100
Received: from [83.64.51.210] (port=7662 helo=gateway1.hale)
	by smartmx-02.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1RdeLA-0004oo-P5 for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:49:28 +0100
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id pBM8nW21020231
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 09:49:32 +0100
Received: from entw48 ([192.168.100.138]) by hale.at with MailEnable ESMTP;
	Thu, 22 Dec 2011 09:49:21 +0100
Date: Thu, 22 Dec 2011 09:49:01 +0100 (CET)
From: Bernhard Guillon <Bernhard.Guillon@hale.at>
X-X-Sender: guib@entw48
To: openembedded-core@lists.openembedded.org
Message-ID: <alpine.DEB.2.00.1112220939580.26143@entw48>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: pBM8nW21020231
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1325148573.49171@S60ef1mXTJFC+LHUOBCY/w
X-Spam-Status: No
Subject: Regression bug: dbus messagebus user generation is wrong
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
X-List-Received-Date: Thu, 22 Dec 2011 08:56:39 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hi all,
we switched the way we chown /usr/libexec/dbus-daemon-launch-helper
with this commit:

commit 46e6c3fa8034b12d178d605f3f5d7efe69671a13
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Fri Oct 21 02:49:51 2011 +0000

     dbus: use useradd class to allow use in read-only filesystems

     Move creation of required user/groups to useradd class thus allowing
     use with read-only filesystems and booting the initial boot.

     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>


We changed the owner ship of the user on the device before this commit. 
Now we change the owner ship on build time which is wrong. If we change 
the owner ship on buildtime we cannot know the gid of the messagebus 
group. On my system it is e.g 117 but on my targtet it is 997. There is no 
standard mapping for gid to names so we need to switch back to change the 
group on the device.

I can send a patch which reenables the postinstall owner ship change if 
you like.

Best regards,
Bernhard


--
Scanned by MailScanner.



