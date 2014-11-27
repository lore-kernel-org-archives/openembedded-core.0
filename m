Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.103])
	by mail.openembedded.org (Postfix) with ESMTP id 5A44772318
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 17:16:54 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:user-agent:mime-version:content-type; 
	b=Bg/tuH1cIuY7ufzH/Xr9sD/TQiKnHjjNK6y5XHHKsOpE+PIe4Bot1J6hVti0rCGkwiXZmWksmxjQ
	guOJ1j3quAfT8k+EFa5cgWVtGeRGKcLLGLhaWUrEKwQqsBKW5DfY  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1417107990287544.5395628193888;
	Thu, 27 Nov 2014 09:06:30 -0800 (PST)
From: Diego <diego.ml@zoho.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Nov 2014 18:06:08 +0100
Message-ID: <2727351.QZhbar3BFX@localhost.localdomain>
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
MIME-Version: 1.0
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Subject: [BUG] Openssh not closing connections on service stop
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
X-List-Received-Date: Thu, 27 Nov 2014 17:17:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

I'd like to share with you what I consider a bug.

I've generally noticed in my Linux experience that I get automatically 
disconnected from an ssh session if the ssh host gets shutdown or rebooted 
with the message:
Connection to x.y.w.z closed by remote host.
Connection to x.y.w.z closed.

This doesn't seem to happen on my OSes built on core-image-minimal with 
openssh support.

Moreover I noticed that if I stop the ssh service:
# /etc/init.d/sshd stop
my ssh connections don't get dropped, I can continue using ssh session like 
nothing happened. I can even see the connection process still up and running:
# ps | grep ssh
 1790 root      4568 S    /usr/sbin/sshd
 1848 root      4852 S    sshd: root@pts/0
 1886 root      2896 S    grep ssh
# /etc/init.d/sshd stop
Stopping OpenBSD Secure Shell server: sshdstopped /usr/sbin/sshd (pid 1790)
.
# ps | grep ssh
 1848 root      4852 S    sshd: root@pts/0
 1894 root      2892 S    grep ssh

Isn't service termination supposed to stop all related connections at the same 
time? Can anybody else reproduce (or not) this issue?

Bests,
Diego


