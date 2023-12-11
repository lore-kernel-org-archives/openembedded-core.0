Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4352FC10F04
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 00:58:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.97072.1702256298578829365
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 16:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sQaFE9Gz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0709ce2531=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB0eLqg029189
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=plRWl
	seEvzSlSQnlbwQ7rBls3zTwH4PTxGKcKIYpwuY=; b=sQaFE9GzBpjIlqGFK8Bc3
	ZnQBYkP61L+gQm7r62QjA+tGFJcYAAZ80W69N1mNmnffBCiHuM1XxOl1bkZlJMTy
	AhLWnMvE4eyqAbXrihpV1iVqu3ymnVx1YAf4ldxZYcixlsAeJisZAkjy+xxVTL0L
	q8HYIoCZlfkDH5KQAy7J6Jon6vrXZ5B9hPH/0h0tBe6H2xlyMhu+7HrIV4pbfX4B
	SThGVYquk3Y0UH818SxPtx/D2g3KL3gXhM3AIBioXCFSb9s/5VnyrcSOj4H1j6hv
	46Yhgl+PRbwv3vzgC4iar1HX1H5Je+AChA62UJPkka71OjIn+LAPTc+6jf3grIwx
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvrmkrvw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:17 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 16:58:21 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 16:58:21 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC PATCH V2 0/5] Fix persistent tmp 
Date: Mon, 11 Dec 2023 08:58:10 +0800
Message-ID: <20231211005815.1119314-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DuNT9uhlWwGxTQg8eRgi1GfLGa2LPCex
X-Proofpoint-ORIG-GUID: DuNT9uhlWwGxTQg8eRgi1GfLGa2LPCex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=908 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 00:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192130

From: Changqing Li <changqing.li@windriver.com>

Hi, All

Currently, VOLATILE_TMP_DIR not works, 
set VOLATILE_TMP_DIR="no", VOLATILE_LOG_DIR="no", after boot target, 
/var/tmp still link to tmpfs /var/volatile/tmp

lrwxrwxrwx  1 root root   11 Mar  9  2018 lock -> ../run/lock
drwxr-xr-x  4 root root 1024 Dec  4 07:55 log
lrwxrwxrwx  1 root root    6 Mar  9  2018 run -> ../run
drwxr-xr-x  3 root root 1024 Mar  9  2018 spool
lrwxrwxrwx  1 root root   12 Mar  9  2018 tmp -> volatile/tmp
drwxrwxrwt  4 root root   80 Dec  4 07:55 volatile

So I do some research, fix this issue and do some other changes accordingly. Please
help to review this patch, thanks.

Targets:
1. Support persistent tmp,  For persistent tmp, only /var/tmp is persistent, /tmp is tmpfs, 
   For volatile tmp, /tmp link to /var/tmp, /var/tmp link to /var/volatile/tmp 
2. make systemd and SysVinit have the same directory structure. 

Currently, systemd and SysVinit have different directory structure, the difference focus on how to handle /tmp.  

when volatile is enabled, for sysVinit, /tmp link to /var/tmp, /var/tmp link to /var/volatile/tmp
refer [4][5]. but for systemd, /tmp is a directory, it is mounted by systemd as tmpfs. /var/tmp 
linked to /var/volatile/tmp.  And for systemd, refer [6], set different age for /tmp and /var/tmp.

Since volatile disabled not works, ignore the difference when volatile is disabled.

With this patch, VOLATILE_TMP_DIR will behavior like this:
For both sysvinit and systemd:
1. VOLATILE_TMP_DIR="yes":
/tmp link to /var/tmp,  /var/tmp link to /var/volatile/log,  /var/volatile is mounted as tmpfs
In this case, for systemd, /tmp and /var/tmp will set to the same age, 10d.

Compare to current behavior, there are 2 changes:
   1) for systemd,  /tmp changed from a directy to a symlink to /var/tmp
   2) age of /tmp and /var/tmp will be same

2. VOLATILE_TMP_DIR="no":
/tmp is a directory mounted as tmpfs, /var/tmp is a directory on persistent fs, and keep the age as [6]

Change like this in order to meet [1][2], also maybe [3] for systemd.

Compare to current behavior, there is one change:
   1) for sysVinit, /tmp changed from a symlink to a directory

[1] https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s18.html
[2] https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html
[3] https://systemd.io/TEMPORARY_DIRECTORIES/
[4] https://git.openembedded.org/openembedded/tree/docs/usermanual/chapters/recipes.xml#n3535
[5] https://git.openembedded.org/openembedded-core/commit/?id=12c4acd7ac5a27cf3676065b60f1c8395c96854c
[6] https://github.com/systemd/systemd/blob/main/tmpfiles.d/tmp.conf
[7] https://www.freedesktop.org/software/systemd/man/latest/tmpfiles.d.html


Test Result of following cases:
1.  
SysVinit 
VOLATILE_TMP_DIR="yes"
VOLATILE_LOG_DIR="yes"

root@qemux86-64:~# ls -al /tmp
lrwxrwxrwx    1 root     root             8 Dec  8 08:51 /tmp -> /var/tmp
root@qemux86-64:~# ls -al /var/log 
lrwxrwxrwx    1 root     root            17 Dec  8 08:51 /var/log -> /var/volatile/log
root@qemux86-64:~# ls -al /var/tmp
lrwxrwxrwx    1 root     root            17 Dec  8 08:51 /var/tmp -> /var/volatile/tmp
root@qemux86-64:~# mount | grep volatile
tmpfs on /var/volatile type tmpfs (rw,relatime)
root@qemux86-64:~# 

2. 
SysVinit 
VOLATILE_TMP_DIR="no"
VOLATILE_LOG_DIR="no"

root@qemux86-64:/# ls -al
drwxr-xr-x   18 root     root          1024 Dec  8 09:22 .
drwxr-xr-x   18 root     root          1024 Dec  8 09:22 ..
drwxr-xr-x    2 root     root          3072 Mar  9  2018 bin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
drwxr-xr-x   13 root     root          2960 Dec  8 09:24 dev
drwxr-xr-x   20 root     root          1024 Dec  8 09:24 etc
drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
drwxr-xr-x    6 root     root          1024 Mar  9  2018 lib
drwx------    2 root     root         12288 Dec  8 09:22 lost+found
drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
dr-xr-xr-x  161 root     root             0 Dec  8 09:24 proc
drwxr-xr-x    4 root     root           240 Dec  8 09:24 run
drwxr-xr-x    2 root     root          3072 Mar  9  2018 sbin
dr-xr-xr-x   12 root     root             0 Dec  8 09:24 sys
drwxrwxrwt    2 root     root            40 Dec  8 09:24 tmp
drwxr-xr-x    9 root     root          1024 Mar  9  2018 usr
drwxr-xr-x   10 root     root          1024 Dec  8 09:24 var
root@qemux86-64:/# cd /var/
root@qemux86-64:/var# ls -al
drwxr-xr-x   10 root     root          1024 Dec  8 09:24 .
drwxr-xr-x   18 root     root          1024 Dec  8 09:22 ..
drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
drwxr-xr-x    2 root     root          1024 Mar  9  2018 cache
drwxr-xr-x    4 root     root          1024 Mar  9  2018 lib
drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
lrwxrwxrwx    1 root     root             9 Dec  8 09:24 lock -> /run/lock
drwxr-xr-x    2 root     root          1024 Dec  8 09:24 log
lrwxrwxrwx    1 root     root             4 Dec  8 09:24 run -> /run
drwxr-xr-x    2 root     root          1024 Mar  9  2018 spool
drwxrwxrwt    2 root     root          1024 Mar  9  2018 tmp
drwxrwxrwt    4 root     root            80 Dec  8 09:24 volatile
root@qemux86-64:/var# mount | grep tmpfs
devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
tmpfs on /var/volatile type tmpfs (rw,relatime)
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=1048576)
root@qemux86-64:/var# 


3. 
systemd
VOLATILE_TMP_DIR="yes"
VOLATILE_LOG_DIR="yes"

root@qemux86-64:/# ls -al /tmp
lrwxrwxrwx    1 root     root             8 Dec  8 08:49 /tmp -> /var/tmp
           8 Dec  8 08:49 /tmp -> /var/tmp
root@qemux86-64:/# cd /var/
root@qemux86-64:/var# ls -al tmp
lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp -> volatile/tmp
root@qemux86-64:/var# ls -al log
lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -> volatile/log
root@qemux86-64:/var# mount | grep tmp
devtmpfs on /dev type devtmpfs (rw,relatime,size=1012160k,nr_inodes=253040,mode=755)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
tmpfs on /run type tmpfs (rw,nosuid,nodev,size=405732k,nr_inodes=819200,mode=755)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=4096k,nr_inodes=1024,mode=755)
tmpfs on /var/volatile type tmpfs (rw,relatime)
root@qemux86-64:/var# 

4.
systemd
VOLATILE_TMP_DIR="no"
VOLATILE_LOG_DIR="no"

root@qemux86-64:/# ls -al
drwxr-xr-x   17 root     root          1024 Dec  8 09:16 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:16 ..
lrwxrwxrwx    1 root     root             7 Mar  9  2018 bin -> usr/bin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
drwxr-xr-x   14 root     root          3260 Dec  8 09:16 dev
drwxr-xr-x   21 root     root          3072 Dec  8 09:16 etc
drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
lrwxrwxrwx    1 root     root             7 Mar  9  2018 lib -> usr/lib
drwx------    2 root     root         12288 Dec  8 09:16 lost+found
drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
dr-xr-xr-x  173 root     root             0 Dec  8 09:16 proc
drwx------    3 root     root          1024 Dec  8 09:16 root
drwxr-xr-x   11 root     root           320 Dec  8 09:16 run
lrwxrwxrwx    1 root     root             8 Mar  9  2018 sbin -> usr/sbin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 srv
dr-xr-xr-x   12 root     root             0 Dec  8 09:16 sys
drwxrwxrwt    9 root     root           180 Dec  8 09:16 tmp
drwxr-xr-x   10 root     root          1024 Mar  9  2018 usr
drwxr-xr-x   10 root     root          1024 Dec  8 09:16 var
root@qemux86-64:/# cd /var/
root@qemux86-64:/var# ls -al
drwxr-xr-x   10 root     root          1024 Dec  8 09:16 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:16 ..
-rw-r--r--    1 root     root           208 Mar  9  2018 .updated
drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
drwxr-xr-x    4 root     root          1024 Dec  8 09:16 cache
drwxr-xr-x    6 root     root          1024 Dec  8 09:16 lib
drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -> ../run/lock
drwxr-xr-x    4 root     root          1024 Dec  8 09:16 log
lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../run
drwxr-xr-x    3 root     root          1024 Mar  9  2018 spool
drwxrwxrwt    5 root     root          1024 Dec  8 09:16 tmp
drwxrwxrwt    2 root     root            40 Dec  8 09:16 volatile
root@qemux86-64:/var# mount | grep tmpfs
devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
tmpfs on /run type tmpfs (rw,nosuid,nodev,size=405732k,nr_inodes=819200,mode=755)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=4096k,nr_inodes=1024,mode=755)
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=1048576)
tmpfs on /var/volatile type tmpfs (rw,relatime)
root@qemux86-64:/var# 

5. 
SysVinit
VOLATILE_TMP_DIR="yes"
VOLATILE_LOG_DIR="no"

root@qemux86-64:/# ls -al
drwxr-xr-x   17 root     root          1024 Dec  8 09:40 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:40 ..
drwxr-xr-x    2 root     root          3072 Mar  9  2018 bin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
drwxr-xr-x   13 root     root          2960 Dec  8 09:40 dev
drwxr-xr-x   20 root     root          1024 Dec  8 09:40 etc
drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
drwxr-xr-x    6 root     root          1024 Mar  9  2018 lib
drwx------    2 root     root         12288 Dec  8 09:40 lost+found
drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
dr-xr-xr-x  159 root     root             0 Dec  8 09:40 proc
drwxr-xr-x    4 root     root           240 Dec  8 09:40 run
drwxr-xr-x    2 root     root          3072 Mar  9  2018 sbin
dr-xr-xr-x   12 root     root             0 Dec  8 09:40 sys
lrwxrwxrwx    1 root     root             8 Dec  8 09:40 tmp -> /var/tmp
drwxr-xr-x    9 root     root          1024 Mar  9  2018 usr
drwxr-xr-x    9 root     root          1024 Dec  8 09:40 var
root@qemux86-64:/# cd /var/
root@qemux86-64:/var# ls -al 
drwxr-xr-x    9 root     root          1024 Dec  8 09:40 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:40 ..
drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
drwxr-xr-x    2 root     root          1024 Mar  9  2018 cache
drwxr-xr-x    4 root     root          1024 Mar  9  2018 lib
drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
lrwxrwxrwx    1 root     root             9 Dec  8 09:40 lock -> /run/lock
drwxr-xr-x    2 root     root          1024 Dec  8 09:40 log
lrwxrwxrwx    1 root     root             4 Dec  8 09:40 run -> /run
drwxr-xr-x    2 root     root          1024 Mar  9  2018 spool
lrwxrwxrwx    1 root     root            17 Dec  8 09:40 tmp -> /var/volatile/tmp
drwxrwxrwt    3 root     root            60 Dec  8 09:40 volatile
root@qemux86-64:/var# mount | grep tmp
devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
tmpfs on /var/volatile type tmpfs (rw,relatime)
root@qemux86-64:/var# 


6. 
systemd
VOLATILE_TMP_DIR="no"
VOLATILE_LOG_DIR="yes"

root@qemux86-64:/# ls -al
drwxr-xr-x   17 root     root          1024 Dec  8 09:46 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:46 ..
lrwxrwxrwx    1 root     root             7 Mar  9  2018 bin -> usr/bin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
drwxr-xr-x   14 root     root          3260 Dec  8 09:46 dev
drwxr-xr-x   21 root     root          3072 Dec  8 09:46 etc
drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
lrwxrwxrwx    1 root     root             7 Mar  9  2018 lib -> usr/lib
drwx------    2 root     root         12288 Dec  8 09:44 lost+found
drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
dr-xr-xr-x  173 root     root             0 Dec  8 09:46 proc
drwx------    3 root     root          1024 Dec  8 09:46 root
drwxr-xr-x   11 root     root           320 Dec  8 09:46 run
lrwxrwxrwx    1 root     root             8 Mar  9  2018 sbin -> usr/sbin
drwxr-xr-x    2 root     root          1024 Mar  9  2018 srv
dr-xr-xr-x   12 root     root             0 Dec  8 09:46 sys
drwxrwxrwt    9 root     root           180 Dec  8 09:46 tmp
drwxr-xr-x   10 root     root          1024 Mar  9  2018 usr
drwxr-xr-x    9 root     root          1024 Dec  8 09:46 var
root@qemux86-64:/# cd /var/
root@qemux86-64:/var# ls -al
drwxr-xr-x    9 root     root          1024 Dec  8 09:46 .
drwxr-xr-x   17 root     root          1024 Dec  8 09:46 ..
-rw-r--r--    1 root     root           208 Mar  9  2018 .updated
drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
drwxr-xr-x    4 root     root          1024 Dec  8 09:46 cache
drwxr-xr-x    6 root     root          1024 Dec  8 09:46 lib
drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -> ../run/lock
lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -> volatile/log
lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../run
drwxr-xr-x    3 root     root          1024 Mar  9  2018 spool
drwxrwxrwt    5 root     root          1024 Dec  8 09:46 tmp
drwxrwxrwt    3 root     root            60 Dec  8 09:46 volatile
root@qemux86-64:/var# mount | grep tmp
devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
tmpfs on /run type tmpfs (rw,nosuid,nodev,size=405732k,nr_inodes=819200,mode=755)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=4096k,nr_inodes=1024,mode=755)
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=1048576)
tmpfs on /var/volatile type tmpfs (rw,relatime)
root@qemux86-64:/var# 

Changqing Li (5):
  bitbake.conf: set correct FILESYSTEM_PERMS_TABLES
  base-files: update dirs1777 and volatiles according to
    VOLATILE_TMP_DIR
  initscripts: support persistent tmp
  systemd: support persistent tmp
  eudev: create dir /tmp if persistent tmp is used

 meta/conf/bitbake.conf                        |  5 ++-
 ...fs-perms.txt => fs-perms-volatile-log.txt} | 32 -------------------
 ...tent-log.txt => fs-perms-volatile-tmp.txt} | 27 ----------------
 meta/files/fs-perms.txt                       |  3 --
 .../base-files/base-files_3.0.14.bb           |  8 +++--
 .../initscripts/initscripts-1.0/volatiles     |  1 +
 .../initscripts/initscripts_1.0.bb            | 12 ++++---
 .../systemd/systemd/00-create-volatile.conf   |  3 +-
 meta/recipes-core/systemd/systemd_254.4.bb    | 23 +++++++++----
 meta/recipes-core/udev/eudev_3.2.14.bb        |  4 +++
 10 files changed, 40 insertions(+), 78 deletions(-)
 copy meta/files/{fs-perms.txt => fs-perms-volatile-log.txt} (53%)
 rename meta/files/{fs-perms-persistent-log.txt => fs-perms-volatile-tmp.txt} (59%)

-- 
2.25.1


