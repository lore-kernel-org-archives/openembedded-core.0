Return-Path: <Kai.Iskratsch@zenotrack.com>
X-Greylist: delayed 317 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Sep 2016 09:41:21 UTC
Received: from zenotrack.com (zenotrack.com [213.164.30.194])
	by mail.openembedded.org (Postfix) with ESMTP id 329E173191
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 09:41:21 +0000 (UTC)
Received: from [192.168.2.60] (192.168.2.60) by VSVR02.ZenoTrack.local
	(192.168.2.242) with Microsoft SMTP Server (TLS) id 14.3.301.0;
	Fri, 16 Sep 2016 11:35:03 +0200
To: <openembedded-core@lists.openembedded.org>
From: Kai Iskratsch <kai.iskratsch@zenotrack.com>
X-ZyXEL-AS-Log: ZW110-zt-zywall-1-MailContent-VirusOutbreak-DNSBL
X-ZyXEL-AS-DLog: eClass[1]-eVirusThreatLevel[0]-RefId[str=0001.0A0C0201.57DBBE43.01A6,
	ss=1, re=0.000, recu=0.000, reip=0]     
Message-ID: <95637002-14dd-f7e7-9532-f307e9023d7f@zenotrack.com>
Date: Fri, 16 Sep 2016 11:36:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
X-Originating-IP: [192.168.2.60]
Subject: How to enable persistent logfiles with systemd?
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
X-List-Received-Date: Fri, 16 Sep 2016 09:41:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all

Since we have system stability issues we need to enable persistent 
logfiles on our system based on yocto 2.0. So i tried a few things but 
the logiles are still created in /run/log/journal.

in /etc/systemd/journald.conf i set
Storage=persistent

and from /etc/default/volatiles/00_core i removed the line which creates 
/var/log/ as a link to /var/volatile/log
and i even created /var/log/journal myself

so now /var/log is a directory on the disk and no longer a link to 
volatile and /var/log/journal exists too, journald does not put any 
files there, the logs get still created in /run/log/journal


root@xxxx:~# ls -la /var/log/journal/
total 8
drwxr-xr-x 2 root root 4096 Sep 16 10:23 .
drwxr-xr-x 6 root root 4096 Sep 16 10:23 ..
root@xxxx:~# ls -la /run/log/journal/
total 0
drwxr-sr-x 3 root systemd-journal  60 Sep 16 10:53 .
drwxr-xr-x 3 root root             60 Sep 16 10:53 ..
drwxr-s--- 2 root systemd-journal 160 Sep 16 10:56 
cb061517ff144c67960c3ff0906cdc41

root@xxxx:~# cat /etc/systemd/journald.conf
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.
#
# Entries in this file show the compile time defaults.
# You can change settings by editing this file.
# Defaults can be restored by simply deleting this file.
#
# See journald.conf(5) for details.

[Journal]
Storage=persistent
Compress=No
Seal=No
#SplitMode=uid
#SyncIntervalSec=5m
#RateLimitInterval=30s
#RateLimitBurst=1000
#SystemMaxUse=
#SystemKeepFree=
#SystemMaxFileSize=
#RuntimeMaxUse=
#RuntimeKeepFree=
#RuntimeMaxFileSize=
#MaxRetentionSec=
#MaxFileSec=1month
#ForwardToSyslog=yes
#ForwardToKMsg=no
#ForwardToConsole=no
#ForwardToWall=yes
#TTYPath=/dev/console
#MaxLevelStore=debug
#MaxLevelSyslog=debug
#MaxLevelKMsg=notice
#MaxLevelConsole=info
#MaxLevelWall=emerg

i am out of ideas what else i have to change to create the logfiles 
persistent.




