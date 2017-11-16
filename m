Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id DF0E57874E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 09:52:52 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 4E42F5C0DBA;
	Thu, 16 Nov 2017 10:47:32 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 16 Nov 2017 10:48:31 +0100
From: Stefan Agner <stefan@agner.ch>
To: alexander.kanavin@linux.intel.com, Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <a316ea0c483e68f37d624e742472d248@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510825652; bh=ek2RRB5s4pZgrMorD3QDZz2FCEjjOq5AoJ+VOTzvo5A=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:Message-ID;
	b=d/Vk3oe0jDTqSd8+LGabRlD4vUyyJfyOM9DgRcWQaFP+uvwo2SIERznJM3Qz8105tQXWKPjH4e7KvboANzVYafk8Bw1nJ4SNWVLgucuFu41S/9oW7xUnCKsOLZGbPjj0ofRYGHYtvAf49CPaWhKf8yuts9lTd0/jO/sU1qML67Q=
Subject: Error when connecting to OpenSSH server using rocko
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
X-List-Received-Date: Thu, 16 Nov 2017 09:52:53 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

We currently experience problems when trying to connect to OpenSSH
servers on rocko distros. Connecting between rocko machines seems to
work, however, connecting from a morty based machine or Desktop
distributions fails:

$ ssh root@192.168.10.171
ssh_dispatch_run_fatal: Connection to 192.168.10.171 port 22: incorrect
signature

The server shows not special sign other than that the client closed the
connection. Forcing Ciphers/MACs seems not to help.

This is ssh used on the client side ArchLinux machine:
$ ssh -V
OpenSSH_7.6p1, OpenSSL 1.1.0g  2 Nov 2017

But the same happens from a Fedora machine:
$ ssh -V
OpenSSH_7.5p1, OpenSSL 1.1.0f-fips  25 May 2017

And morty based machine:
# ssh -V
OpenSSH_7.3p1, OpenSSL 1.0.2j  26 Sep 2016


The OpenSSH version on rocko:
# ssh -V
OpenSSH_7.5p1, OpenSSL 1.0.2l  25 May 2017

I also backported 7.6p1 from master, but it fails as well.

It seems that at least OpenSSH 7.5p1/7.6p1 is broken with the OpenSSL
1.0 version used in rocko...

In a quick test I removed the PREFERRED_VERSION_openssl to get 1.1.0f,
removed openssl10 DEPENDS in the openssh recipe and added the ArchLinux'
openssl-1.1.0.patch:

# ssh -V 
OpenSSH_7.5p1, OpenSSL 1.1.0f  25 May 2017

With that I could login.

User nayfe on IRC reported the same issue.

I guess moving rocko to OpenSSL 1.1 is not really an option at this
point? Thoughts?

--
Stefan

