Received: from smtp24.4emm.com ([69.18.222.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S8RG5-0004UY-Hn
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 08:07:29 +0100
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB24.4emm.local ([fe80::2c09:98d1:4a87:91f6%18]) with mapi id
	14.01.0289.001; Fri, 16 Mar 2012 02:58:41 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: race condition... in cp?
Thread-Index: Ac0DQXsSm6HLvmmxQqWA089c7axNiA==
Date: Fri, 16 Mar 2012 06:58:40 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF33809F54@MBX20.4emm.local>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: race condition... in cp?
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
X-List-Received-Date: Fri, 16 Mar 2012 07:07:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I got a strange error when bitbaking two images after removing some files i=
n the deploy/images folder.
It looks a whole lot like the cp's from the individual tasks were racing...=
 I didn't know this sort of thing could happen.

bitbake rica-dev-image rica-release-example-image
<...>
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for runtime libssl (openssl-nativesd=
k, openssl)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libssl
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 3673 of 3692 (ID: 23, /home/james/oe/meta-rica5/recipes/=
images/rica-release-example-image.bb, do_rootfs)
NOTE: Running task 3685 of 3692 (ID: 8, /home/james/oe/meta-rica5/recipes/i=
mages/rica-dev-image.bb, do_rootfs)
NOTE: package rica-release-example-image-1.0-r0: task do_rootfs: Started
NOTE: package rica-dev-image-1.0-r0: task do_rootfs: Started
ERROR: Function failed: do_rootfs (see /home/james/oe/build/tmp-eglibc/work=
/rica5-rica-linux-gnueabi/rica-dev-image-1.0-r0/temp/log.do_rootfs.4011 for=
 further information)
ERROR: Logfile of failure stored in: /home/james/oe/build/tmp-eglibc/work/r=
ica5-rica-linux-gnueabi/rica-dev-image-1.0-r0/temp/log.do_rootfs.4011
Log data follows:
| ERROR: Function failed: do_rootfs (see /home/james/oe/build/tmp-eglibc/wo=
rk/rica5-rica-linux-gnueabi/rica-dev-image-1.0-r0/temp/log.do_rootfs.4011 f=
or further information)
| cp: cannot create regular file `/home/james/oe/build/tmp-eglibc/deploy/im=
ages/rica5/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt': File exists
NOTE: package rica-dev-image-1.0-r0: task do_rootfs: Failed
ERROR: Task 8 (/home/james/oe/meta-rica5/recipes/images/rica-dev-image.bb, =
do_rootfs) failed with exit code '1'
Waiting for 1 active tasks to finish:
0: rica-release-example-image-1.0-r0 do_rootfs (pid 4008)
NOTE: package rica-release-example-image-1.0-r0: task do_rootfs: Succeeded
NOTE: Tasks Summary: Attempted 3685 tasks of which 3683 didn't need to be r=
erun and 1 failed.
pseudo: You must set the PSEUDO_PREFIX environment variable to run pseudo.
pseudo: You must set the PSEUDO_PREFIX environment variable to run pseudo.

Summary: 1 task failed:
  /home/james/oe/meta-rica5/recipes/images/rica-dev-image.bb, do_rootfs
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Perhaps we should be using cp -f, or discarding the result?
=A0=A0
Regards,
James Limbouris




