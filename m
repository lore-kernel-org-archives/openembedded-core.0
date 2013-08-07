Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 137D86B5CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 11:55:36 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cy12so1640138veb.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 04:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FggHmMa7KvgtiECGuBAShhD3VIwpRlGOo/VjoGwD79s=;
	b=LfsyYhJCPdPEfoU3JEcOvJdQ3CCj04I7jnOTSNKsp1RcaGw0nRkdoaufjwB6FSdpc/
	oCcjeoBttdY5MYwpMAAnEEtqP8+IzfJCihpnuxImzXbIX7zoRnA8zvM5W6PzoLXNJIKj
	8F7uwDVk9tliNd7RJpvMe+7hLz+ByJCtqRDu3xWpy+D/3xlsgo3VQ/9t1AphKVwagLw5
	jrmHnBNMebP7rtRMsKZJ7NuPLjTKoFfT8IUnydojObzupaUieehqvy3JGQeKf9Syu67R
	0yvawV7GVmHFloZTMQiIBzJNPEL1SS8fXOHpP47imRwdpUopUOhZkwJNYzDYl3feu040
	tvdw==
X-Gm-Message-State: ALoCoQlbaEE/kOtnEaKbIgz+mS6DCae/3MD1BC1z+FjQR4Sor60wFD5nLDpDNtRFWoqvRUXOwKRz
X-Received: by 10.52.73.33 with SMTP id i1mr88763vdv.51.1375876537504; Wed, 07
	Aug 2013 04:55:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 7 Aug 2013 04:55:17 -0700 (PDT)
In-Reply-To: <5201F783.4020601@windriver.com>
References: <cover.1374643300.git.rongqing.li@windriver.com>
	<947336a1ef2b936328ba6fcf519d55a4eda7085d.1374643300.git.rongqing.li@windriver.com>
	<5201F783.4020601@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Aug 2013 12:55:17 +0100
Message-ID: <CAJTo0LZw9kOSmQbeQM71JGZh36nYy58o=ZEB_oA8nYOFBtqZTw@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: ignore qemu output, and check its return code
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
X-List-Received-Date: Wed, 07 Aug 2013 11:55:37 -0000
Content-Type: text/plain; charset=UTF-8

On 7 August 2013 08:30, Rongqing Li <rongqing.li@windriver.com> wrote:
>>                 ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')}
>> hwdb --update \
>> -                       --root $D
>> +                       --root $D 2>/dev/null
>> +
>> +               [ $? -ne 0 ] && exit 1

The $? check can be removed replaced by set -e, as many postinst
scripts do already.

Why/where is the output from runqemu considered an error?  I wasn't
aware that logs were monitored for that error message.  I don't think
we should be hiding the output of runqemu as any real errors will also
be hidden.

Ross

