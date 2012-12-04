Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Li.Wang@windriver.com>) id 1TfhWo-0000dK-Hu
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 02:42:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB41S6in021128
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Dec 2012 17:28:06 -0800 (PST)
Received: from [128.224.162.210] (128.224.162.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 3 Dec 2012 17:28:06 -0800
Message-ID: <50BD51A2.7010208@windriver.com>
Date: Tue, 4 Dec 2012 09:28:02 +0800
From: "Li.Wang" <Li.Wang@windriver.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1353996801-28402-1-git-send-email-li.wang@windriver.com>
	<50B93620.6050203@intel.com>
	<CAJTo0LY0WG_QNWT-aPW1jSnz9Ox8sHLfDQUs6KbXCEgF7zgo0g@mail.gmail.com>
In-Reply-To: <CAJTo0LY0WG_QNWT-aPW1jSnz9Ox8sHLfDQUs6KbXCEgF7zgo0g@mail.gmail.com>
X-Originating-IP: [128.224.162.210]
Cc: openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH] openssh: CVE-2011-4327
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 01:42:31 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

This is my neglect.
The function has already been removed from OpenSSH prior to version 5.8p2:
ChangeLog:
20110505
 - (djm) [Makefile.in WARNING.RNG aclocal.m4 buildpkg.sh.in configure.ac]
   [entropy.c ssh-add.c ssh-agent.c ssh-keygen.c ssh-keyscan.c]
   [ssh-keysign.c ssh-pkcs11-helper.c ssh-rand-helper.8 ssh-rand-helper.c]
   [ssh.c ssh_prng_cmds.in sshd.c contrib/aix/buildbff.sh]
   [regress/README.regress] Remove ssh-rand-helper and all its
   tentacles. PRNGd seeding has been rolled into entropy.c directly.
   Thanks to tim@ for testing on affected platforms.

So, please revert the patch.
Thanks,
LiWang.

Burton, Ross wrote:
> On 30 November 2012 22:41, Scott Garman <scott.a.garman@intel.com> wrote:
>   
>> The second link you referenced above explains that the vulnerability exists
>> in versions prior to openssh 5.8p2, and yet your patch was submitted against
>> openssh 6.0p1. So it seems that this would not apply. Or am I
>> misunderstanding the nature of the bug?
>>     
>
> Prior to 5.8p2 *and* not Linux:
>
> 2. Affected configurations
>
>         Portable OpenSSH prior to version 5.8p2 only on platforms
>         that are configured to use ssh-rand-helper for entropy
>         collection.
>
>         ssh-rand-helper is enabled at configure time when it is
>         detected that OpenSSL does not have a built-in source of
>         randomness, and only used at runtime if this condition
>         remains. Platforms that support /dev/random or otherwise
>         configure OpenSSL with a random number provider are not
>         vulnerable.
>
>         In particular, *BSD, OS X, Cygwin and Linux are not
>         affected.
>
> Ross
>   



