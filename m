Return-Path: <okonopli@cisco.com>
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
	by mail.openembedded.org (Postfix) with ESMTP id C594265CF3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4233; q=dns/txt; s=iport;
	t=1524045900; x=1525255500;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=FXu8gnw7gdL2HK71YxwR4Ah+mA/qMBmi0agd5FO++ik=;
	b=XHindEjl9bvFd1s5qOIBJx6ARpvXziP9FJ5k40uiU3FrL5/NRue5Eu2p
	Fs5IeFLwCl9VRfDN0ear9zEyracS/ABFdk6OTSmJQx7UuhuX3RudAubNf
	nFArdqqTYY2cVFLG9Ivd/VHrgddTzFaCGnyG+mVtLBLrcxNOU7orPLbQ4 s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DdBAACFdda/5ldJa1dGwEBAQEDAQE?=
	=?us-ascii?q?BCQEBAYNCgVuEEJULgUspgQ+SbhSBZAuEaQKCXyE1FwECAQEBAQEBAmwohSM?=
	=?us-ascii?q?BBSMPAQVRCQIYAgIRFQICVwYBDAgBAYR8DYpym0CCHIRXg2uCJRR1hn2BVD+?=
	=?us-ascii?q?BMoJohC4vVYJBgjQgAoxliwUIjjUGgTSGFYUEhzSISQIECwITAYElHgI0gVJ?=
	=?us-ascii?q?wFYJ/gkeOCTyOeQEB?=
X-IronPort-AV: E=Sophos;i="5.48,464,1517875200"; d="scan'208";a="382793547"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
	by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Apr 2018 09:55:25 +0000
Received: from [10.21.84.46] (sjc-vpn4-1071.cisco.com [10.21.84.46])
	(authenticated bits=0)
	by rcdn-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w3I9tMPp008058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 18 Apr 2018 09:55:24 GMT
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
References: <1520865187-13798-1-git-send-email-okonopli@cisco.com>
	<1520873954.3748.6.camel@andred.net>
	<052b3c4d-084c-9434-e47d-b68c068cd958@cisco.com>
	<1522765421.26897.51.camel@andred.net>
From: Oleksii Konoplitskyi <okonopli@cisco.com>
Message-ID: <a5a81d79-7cb9-ecb2-4d11-4301cf0c63bd@cisco.com>
Date: Wed, 18 Apr 2018 12:55:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1522765421.26897.51.camel@andred.net>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: okonopli
Subject: Re: [PATCH] core-image-minimal-initramfs: prepare initramfs for NFS boot
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
X-List-Received-Date: Wed, 18 Apr 2018 10:04:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Andre,

I could boot my device using your code (+ parsing nfs server ip address 
from ip option):

nfsrootfs_run() {
     local nfs_opts
     local location
     local flags
     local server_ip

     nfs_opts=""
     if [ "${bootparam_nfsroot#*,}" != "${bootparam_nfsroot}" ]; then
         nfs_opts="-o ${bootparam_nfsroot#*,}"
     fi

     location="${bootparam_nfsroot%%,*}"
     if [ "${location#*:}" = "${location}" ]; then
         # server-ip is not given. Get server ip from ip option
         server_ip=""
         if [ "${bootparam_ip#*:}" != "${bootparam_ip}" ]; then
             server_ip=$(echo "$bootparam_ip" | cut -d: -f2)
         fi

         if [ -z "$server_ip" ]; then
             fatal "Server IP is not set. Update ip or nfsroot options."
         fi
         location=${server_ip}:${location}
     fi

     flags="-o nolock"
     if [ -n "$bootparam_ro" ] && ! echo "$bootparam_rootflags" | grep 
-w -q "ro"; then
         if [  -n "$bootparam_rootflags" ]; then
             bootparam_rootflags="$bootparam_rootflags,"
         fi
         bootparam_rootflags="${bootparam_rootflags}ro"
     fi
     if [ -n "$bootparam_rootflags" ]; then
         flags="$flags -o$bootparam_rootflags"
     fi

     mount -t nfs ${flags} ${nfs_opts} ${location} ${ROOTFS_DIR}
}

Should module fail if ip is set to dhcp (or off)?

Should we mount rootfs via nfs if "nfsroot" option is not set?

Best regards,
Oleksii


On 03.04.18 17:23, André Draszik wrote:
> Thanks!
>
> On Fri, 2018-03-16 at 20:20 +0200, Oleksii Konoplitskyi wrote:
>> Taking into account your recommendations, module should have the next
>> content:
>>
>> nfsrootfs_enabled() {
>>       [ -z ${bootparam_nfsroot+x} ] && return 1
>>       return 0
>> }
>>
>> nfsrootfs_run() {
>>       nfs_mount_point=$(echo $bootparam_nfsroot | cut -d ',' -f 1)
>>       nfs_mount_params=$(echo $bootparam_nfsroot | cut -d ',' -f 2)
>>
>>       mount -t nfs ${nfs_mount_point} -o nolock,${nfs_server_params}
>> $ROOTFS_DIR
>> }
> Actually, this is missing various things, according to
> linux/Documentation/filesystems/nfs/nfsroot.txt
>
> nfsroot=[<server-ip>:]<root-dir>[,<nfs-options>]
>
> * The server-ip is optional (and would be taken from the ip= option in
>    that case)
> * there can be more than one nfs-option (which is probably more important
>    to fix)
> * it ignores the 'ro' or rootflags=ro option
>
> Maybe something like this (completely untested):
>
> nfsrootfs_run() {
>      local nfs_opts
>      local location
>      local flags
>
>      nfs_opts=""
>      if [ "${bootparam_nfsroot#*,}" != "${bootparam_nfsroot}" ] ; then
>          nfs_opts="-o ${bootparam_nfsroot#*,}"
>      fi
>      location="${bootparam_nfsroot%%,*}"
>      if [ "${location#*:}" = "${location}" ]; then
>          # server-ip not given
>          location=${ROOTSERVER}:${location}
>      fi
>
>      flags="-o nolock"
>      if [ -n "$bootparam_ro" ] && ! echo "$bootparam_rootflags" | grep -w -q "ro"; then
>          if [  -n "$bootparam_rootflags" ]; then
>              bootparam_rootflags="$bootparam_rootflags,"
>          fi
>          bootparam_rootflags="${bootparam_rootflags}ro"
>      fi
>      if [ -n "$bootparam_rootflags" ]; then
>          flags="$flags -o$bootparam_rootflags"
>      fi
>
>      mount -t nfs ${flags} ${nfs_opts} ${location} ${ROOTFS_DIR}
> }
>
> ? Just need to get at $ROOTSERVER now, or at least issue a warning that it
> should be given on the command line.
>
>
>> What module is responsible for network configuration and network driver
>> loading?
> I'd say IP should be separate, as you can then also easily add DHCP or
> zeroconf. It's not really related to nfsroot (except for the ROOTSERVER
> bit).
> Network driver loading should definitely be a machine specific thing...
>
>> Should it be separate custom module in initramfs-framework not related
>> to upstream?
>>
>> Best regards,
>> Oleksii
>
> Cheers,
> Andre'
>


