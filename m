Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id D6A5F6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 12:36:22 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id q11so2822607pdj.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 05:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=4ge4jZ6zTEkoFLi7j4J8ns5bxkXHodp6x19RiZO8y7o=;
	b=vLxeCD+ANqaxL5pMnSrWALEmFEbhQJaNabKDUzZwP0U+/6+LsaboQpTxOJRhAH6UcM
	eLwNVDLf/Ey/UPTQY5xPepXVcWXZl0/21uYvOZzkHed2fAnfYOekijWoSQJ7OEz5puBk
	Ig2j6t50ibunn5epE8UOAZ5/JC9TzciD/trHELVOPLK7i16tL3FwKAMlm/OdM4HJRXAN
	5mwBl3KbTlAymJ2+9ZVmOLkhP4wBx43LMSg/IumfaKo2NV4VsEiBJDdCcETYo6yrnRjX
	Za0aZz5Ql6xK3RyAUfOEuneOPWjM2e0fHn+6/MzzKvDxwsytbBylNpKtFPjPEVndj4BE
	QNKA==
X-Received: by 10.68.196.1 with SMTP id ii1mr12846953pbc.200.1369312584121;
	Thu, 23 May 2013 05:36:24 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id 10sm11555212pbr.45.2013.05.23.05.36.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 May 2013 05:36:23 -0700 (PDT)
Message-ID: <519E0C26.40502@gmail.com>
Date: Thu, 23 May 2013 22:31:34 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1369281734-7989-1-git-send-email-net147@gmail.com>
	<1369309132.14887.32.camel@ted>
In-Reply-To: <1369309132.14887.32.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus: remove /var/run from package as it is created on startup
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
X-List-Received-Date: Thu, 23 May 2013 12:36:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2013 9:38 PM, Richard Purdie wrote:
> On Thu, 2013-05-23 at 14:02 +1000, Jonathan Liu wrote:
>> /var/run is a tmpfs that is created on startup.
>> For sysvinit, /var/run/dbus is created by populate-volatiles.sh.
>> For systemd, /var/run/dbus is created implicitly by dbus.socket when
>> creating a listen stream socket at /var/run/dbus/system_bus_socket.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/recipes-core/dbus/dbus.inc | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
>> index 2be5bda..8055824 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -101,9 +101,9 @@ do_install() {
>>   	     > ${D}${sysconfdir}/default/volatiles/99_dbus
>>   
>>
>> -	mkdir -p ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
>> +	mkdir -p ${D}${localstatedir}/lib/dbus
>>   
>> -	chown messagebus:messagebus ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
>> +	chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
> Is what populate-volatiles does truly equivalent? Does this directory
> need to be owned by messagebus (which is a user created by dbus) iirc?
>
> Cheers,
>
> Richard
The dbus recipe writes /etc/default/volatiles/99_dbus.
For sysvinit case, this will cause populate-volatiles.sh to create 
/var/run/dbus owned by messagebus:messagebus with 0755 permissions so it 
is the same.
The systemd init doesn't use populate-volatiles.sh and it's created 
implicitly so it is owned by root:root with 0755 permissions.

For distributions using sysvinit (e.g. Debian), /var/run/dbus is 
typically owned by messagebus:messagebus. There is no dbus user/group in 
/etc/passwd or /etc/group.
For distributions using systemd (e.g. Arch Linux and Fedora), 
/var/run/dbus (actually /run/dbus) is typically owned by root:root. 
There is no messagebus user/group in /etc/passwd or /etc/group, but 
there is dbus.

Regards,
Jonathan

