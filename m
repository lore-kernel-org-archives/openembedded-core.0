Return-Path: <net147@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id A651760034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 09:02:43 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so18451856pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=vEpoVk2MTiQx5hQKrv2D8MWvUoK+EpAcjtxGxt8t88I=;
	b=NmkWfM0iMcVAiqo/EmdaVWBdKjPynbuWePmQRXVW7VfwH1WhxiMbb1ivBDzlOy4HY0
	oumBtZX/9wgqdLqUO+kQmWuT02AYhPZd1M0TybO61ICadsP6SSROVp9pzPjY/IE6MHeB
	Ei9bb3npRlGGIm/DzvWlLb0WNHz4O4OsOcOBPsES2egNQouKqLMzKranh7fw7kRogN67
	eTa/TMpfUPoUyuOqkDfJkqj7Fu1idaziw+wnS2OTiEptnRdem8hpuDdns2Hydt/V5oqo
	3N7QixTFbWgDq1tZETPvDLpW/XzHO9vkyU8nBMEaZ+N0sITZwosLfhG52xPvZDiP+k9j
	hWag==
X-Received: by 10.70.136.202 with SMTP id qc10mr86729432pdb.117.1426150964062; 
	Thu, 12 Mar 2015 02:02:44 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id lr1sm4114501pab.39.2015.03.12.02.02.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 02:02:43 -0700 (PDT)
Message-ID: <5501562B.1040907@gmail.com>
Date: Thu, 12 Mar 2015 20:02:35 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, ChenQi <Qi.Chen@windriver.com>
References: <1425957930-8061-1-git-send-email-net147@gmail.com>
	<55013CDD.3050708@windriver.com>
	<1C1D4049-981D-4FA6-AC57-7F1AA5B45125@gmail.com>
In-Reply-To: <1C1D4049-981D-4FA6-AC57-7F1AA5B45125@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Thu, 12 Mar 2015 09:02:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2015 6:21 PM, Khem Raj wrote:
>> On Mar 12, 2015, at 12:14 AM, ChenQi <Qi.Chen@windriver.com> wrote:
>>
>> On 03/10/2015 11:25 AM, Jonathan Liu wrote:
>>> The ownership needs to be explicitly set otherwise it inherits the user
>>> and group id of the build user.
>>>
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd_219.bb | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
>>> index 24486f1..6a4f4e8 100644
>>> --- a/meta/recipes-core/systemd/systemd_219.bb
>>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>>> @@ -147,6 +147,8 @@ do_install() {
>>>   		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
>>>   	fi
>>>   +	chown root:root ${D}/${localstatedir}/log/journal
>>> +
>>>           # Delete journal README, as log can be symlinked inside volatile.
>>>           rm -f ${D}/${localstatedir}/log/README
>>>   
>> I think it should be root:systemd-journal.
>> What do you think?
>>
>> And this patch would also fix the following bug.
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7293
> /var/log is symlinked (its not a copy-bind) into /var/volatile/log and /var/volatile  is mounted as tmpfs on runtime as of now
> so how is this patch helping out with anything ?
It fixes uid/gid of build user leaking into the filesystem image even if 
the directory is hidden at runtime by tmpfs being mounted at /var/volatile.

I was considering removing /var/log/journal (actually 
/var/volatile/log/journal) from the rootfs but it would be a behavior 
change.
journald.conf by default tests for the presence of the /var/log/journal 
directory and if it exists it will write there (instead of 
/run/log/journal) assuming it is persistent.
An OpenEmbedded user could try making the journal persistent by removing 
the /var/volatile tmpfs entry from /etc/fstab (I remember seeing this 
mentioned somewhere on the web). This would make /var/volatile persistent...

I opted to keep /var/log/journal but fix the uid/gid to avoid surprises.
You're right though, it should be root:systemd-journal.

Regards,
Jonathan


