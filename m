Return-Path: <pderocco@ix.netcom.com>
X-Greylist: delayed 694 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Sep 2015 23:08:45 UTC
Received: from elasmtp-spurfowl.atl.sa.earthlink.net
	(elasmtp-spurfowl.atl.sa.earthlink.net [209.86.89.66])
	by mail.openembedded.org (Postfix) with ESMTP id CCC8576FDE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 23:08:45 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=dk20050327; d=ix.netcom.com;
	b=h1NCKzdpBHcAMBL9RiRCz9pYM2vdUHmu2DZej9UWdpUaFBEWACaKlvlcivkEumLC;
	h=Received:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:X-MimeOLE:X-ELNK-Trace:X-Originating-IP;
Received: from [45.49.236.199] (helo=PAULD)
	by elasmtp-spurfowl.atl.sa.earthlink.net with esmtpa (Exim 4.67)
	(envelope-from <pderocco@ix.netcom.com>) id 1ZcLdS-0005Yn-Mt
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Sep 2015 18:57:06 -0400
From: "Paul D. DeRocco" <pderocco@ix.netcom.com>
To: "OpenEmbedded list" <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Sep 2015 15:57:11 -0700
Message-ID: <DECE55FFDD9A4BE0A917289E0F6A7775@PAULD>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AdDw0wWnqPVV1P/mSsK3xw4ExAFkqg==
X-MimeOLE: Produced By Microsoft MimeOLE V6.1.7601.17609
X-ELNK-Trace: bd7d5d4e6f8f652c74cfc7ce3b1ad11381c87f5e519606884b45801dbd98930a1f585682eef67f5b350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 45.49.236.199
Subject: Migrating from Samba 3 to 4
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
X-List-Received-Date: Wed, 16 Sep 2015 23:08:46 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

A couple years ago, I included Samba 3 in a Yocto (Dylan branch) project,
and got it working. It included a custom smb.conf file, and an added
usermap file. I'm doing a new version of that project using the Yocto Fido
branch, and incorporating Samba 4, whose recipe works differently.

To provide a custom smb.conf, I simply did the usual .bbappend prepending
my own files subdirectory containing the new smb.conf. The new recipe
copies smb.conf explicitly inside a do_install_append() function, so never
looks for mine.

To provide a usermap file, I created a do_install_append() that created
the necessary subdirectories and copied the file. Worked fine.

Neither of those is working now. The final sysroot contains the stock
smb.conf and no usermap. I'm a bitbake near-newbie, so I need some help.
Why wouldn't my do_install_append() be called? Isn't it legal to have one
in the .bb and another in the .bbappend?

And what is the now-accepted method of supplying a custom smb.conf?
Copying it in a do_install_append(), or by running a little script with
ROOTFS_POSTPROCESS_COMMAND? Is the latter how I should be doing both of
these things?

-- 

Ciao,               Paul D. DeRocco
Paul                mailto:pderocco@ix.netcom.com


