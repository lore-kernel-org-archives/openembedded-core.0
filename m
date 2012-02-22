Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=392e25361=rich.pixley@palm.com>)
	id 1S0Lpp-0004Uc-BA for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 00:42:57 +0100
X-IronPort-AV: E=Sophos;i="4.73,466,1325491200"; d="scan'208,217";a="11845253"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 22 Feb 2012 15:33:31 -0800
Received: from fuji.noir.com ([10.100.2.13])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q1MNXULm019417;
	Wed, 22 Feb 2012 15:33:30 -0800
Message-ID: <4F457B4B.4000507@palm.com>
Date: Wed, 22 Feb 2012 15:33:31 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: sharing DL_DIR?
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
X-List-Received-Date: Wed, 22 Feb 2012 23:42:57 -0000
Content-Type: multipart/alternative;
	boundary="------------070108090307090607000505"

--------------070108090307090607000505
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Is it reasonable to expect to share DL_DIR between multiple builds?

That is, are downloads properly locked so that multiple concurrent 
downloads of the same file won't collide?  And if so, are they NFS safe 
locks?

Or must each build download it's own copies of every component?

I ask because our, (Palm), branch has been, but it's a bit of a nuisance 
to pick a suitable locking mechanism that is both functional and performant.

  * Flock/lockf aren't reliably supported in heterogeneous environments.
  * The old lockfiles don't work over NFS. Lock directories apparently
    do, but trying to clean these up after interruptions or failures is
    a losing battle so if we do use these, we end up with orphan locks
    periodically.
  * With NFS as a possibility, we can't assume any kernel local IPC
    mechanism, so sysV ipc is out.
  * It seems like a pretty huge overhead to try to create any sort of
    zeroconf overhead.

Our solution so far has been to use NFS lock directories for multiple 
machine builds and flock/lockf for single machine builds.  This mostly 
works, though it's not ideal, and it's significantly faster than 
downloading/copying all of the component source multiple times even over 
local mirrors.

--rich

--------------070108090307090607000505
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Is it reasonable to expect to share DL_DIR between multiple builds?<br>
    <br>
    That is, are downloads properly locked so that multiple concurrent
    downloads of the same file won't collide?&nbsp; And if so, are they NFS
    safe locks?<br>
    <br>
    Or must each build download it's own copies of every component?<br>
    <br>
    I ask because our, (Palm), branch has been, but it's a bit of a
    nuisance to pick a suitable locking mechanism that is both
    functional and performant.<br>
    <ul>
      <li>Flock/lockf aren't reliably supported in heterogeneous
        environments.</li>
      <li>The old lockfiles don't work over NFS. Lock directories
        apparently do, but trying to clean these up after interruptions
        or failures is a losing battle so if we do use these, we end up
        with orphan locks periodically.</li>
      <li>With NFS as a possibility, we can't assume any kernel local
        IPC mechanism, so sysV ipc is out.</li>
      <li>It seems like a pretty huge overhead to try to create any sort
        of zeroconf overhead.</li>
    </ul>
    <p>Our solution so far has been to use NFS lock directories for
      multiple machine builds and flock/lockf for single machine
      builds.&nbsp; This mostly works, though it's not ideal, and it's
      significantly faster than downloading/copying all of the component
      source multiple times even over local mirrors.<br>
    </p>
    --rich<br>
  </body>
</html>

--------------070108090307090607000505--
