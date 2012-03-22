Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SAgy9-00048K-VV
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 13:18:18 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id F2D09A6292;
	Thu, 22 Mar 2012 13:09:19 +0100 (CET)
Date: Thu, 22 Mar 2012 13:09:18 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120322130918.189674f6@eb-e6520>
In-Reply-To: <4F6A5458.9030904@linux.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<20120321230514.1c170480@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B6A9@ORSMSX106.amr.corp.intel.com>
	<4F6A5458.9030904@linux.intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Thu, 22 Mar 2012 12:18:18 -0000
X-Groupsio-MsgNum: 19415
Content-Type: multipart/mixed; boundary="MP_/d4HTjGk=8wuT02l2kkOstim"

--MP_/d4HTjGk=8wuT02l2kkOstim
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

thanks to the help of Woglinde on IRC, here is some log which shows a
wrong rpath which explains why the sdk libraries are not used.
This doesn't solves the double free problem which seems related to
the SDK's libpython

Eric

--MP_/d4HTjGk=8wuT02l2kkOstim
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=sdk_gdb_log.txt

$ chrpath -l arm-oe-linux-gnueabi-gdb 
arm-oe-linux-gnueabi-gdb: RPATH=/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi:/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib

$ ldd arm-oe-linux-gnueabi-gdb 
./arm-oe-linux-gnueabi-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libc.so.6: version `GLIBC_2.14' not found (required by /lib64/libz.so.1)
	linux-vdso.so.1 =>  (0x00007fff26fff000)
	libreadline.so.6 => /lib64/libreadline.so.6 (0x0000003ba3a00000)
	libdl.so.2 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libdl.so.2 (0x00007f670a379000)
	libncurses.so.5 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libncurses.so.5 (0x00007f670a156000)
	libtinfo.so.5 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libtinfo.so.5 (0x00007f6709f2f000)
	libz.so.1 => /lib64/libz.so.1 (0x0000003ba3200000)
	libm.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libm.so.6 (0x00007f6709cac000)
	libpthread.so.0 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libpthread.so.0 (0x00007f6709a8f000)
	libutil.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libutil.so.1 (0x00007f670988b000)
	libexpat.so.1 => /lib64/libexpat.so.1 (0x0000003ba7200000)
	libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libc.so.6 (0x00007f6709504000)
	/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x0000003ba1600000)

$ find /usr/local/oecore-x86_64/ -iname libz*
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/libz.so.1.2.6
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/libz.so.1
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/var/lib/opkg/info/libz1.control
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/var/lib/opkg/info/libz1.list
$ find /usr/local/oecore-x86_64/ -iname libreadline*
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/libreadline.so.6.2
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/libreadline.so.6
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/var/lib/opkg/info/libreadline6.control
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/var/lib/opkg/info/libreadline6.list
$ find /usr/local/oecore-x86_64/ -iname libexpat*
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/libexpat.so.1
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/libexpat.so.1.5.2
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/var/lib/opkg/info/libexpat1.control
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/var/lib/opkg/info/libexpat1.list

$  sudo chrpath -r "/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib:/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib" arm-oe-linux-gnueabi-gdb 
arm-oe-linux-gnueabi-gdb: RPATH=/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi:/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib
arm-oe-linux-gnueabi-gdb: new RPATH: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib:/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib
$ ldd arm-oe-linux-gnueabi-gdb 
	linux-vdso.so.1 =>  (0x00007fff215ff000)
	libreadline.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/libreadline.so.6 (0x00007f1603aa2000)
	libdl.so.2 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libdl.so.2 (0x00007f160389d000)
	libncurses.so.5 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libncurses.so.5 (0x00007f160367a000)
	libtinfo.so.5 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libtinfo.so.5 (0x00007f1603453000)
	libz.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/libz.so.1 (0x00007f160323d000)
	libm.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libm.so.6 (0x00007f1602fbb000)
	libpthread.so.0 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libpthread.so.0 (0x00007f1602d9e000)
	libutil.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libutil.so.1 (0x00007f1602b9a000)
	libexpat.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/libexpat.so.1 (0x00007f1602971000)
	libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libc.so.6 (0x00007f16025ea000)
	/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x0000003ba1600000)

$ arm-oe-linux-gnueabi-gdb 
*** glibc detected *** arm-oe-linux-gnueabi-gdb: double free or corruption (out): 0x0000000002347030 ***
Abandon (core dumped)

--MP_/d4HTjGk=8wuT02l2kkOstim--
