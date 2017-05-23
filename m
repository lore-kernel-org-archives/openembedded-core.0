Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1E571A75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 15:29:19 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id d127so30704971wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ga5wA0JHkjuOZpKUVd0OV1mU4ADRjyce6H0ag43vXJ0=;
	b=DdnEoUEp3DsPB6hl7IhXPml10BwyQ/JHj5/BR18maaULAr1AzO/FfObBmSIolK/jAH
	Ze93NFAXHfljDuBqscNslU9k8RxixMiE7nwCjxY3UMBbGnO5wSLBaN0FeFsd8FsQGoZM
	j5dHdrTMiqEDt9a/f0tGFakj/u6fQPJlj4Ar7IS2EN7JW0CE1YEsdrKDe0e+UcZOoG8v
	SvwlNVLG3R3Amf9UAUspuW4htT8MeDTDk6bKEjyN7a8mTq4qoY2N8SQd/lCQSPdwkZye
	IiFQd5QxVy6w8m9JbVX9kkNcqEaflw0ecT+SDgpg4fp7QNOYrbHQqVQKz99CmDP2PiF8
	bNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ga5wA0JHkjuOZpKUVd0OV1mU4ADRjyce6H0ag43vXJ0=;
	b=gXCimn6nIUEzQmd6Nn74A6YIL2BuQxY1ZVSMQyh3Zo1a7+JbHDXGQeopGDMgBXhAco
	VnKYGyBEP5D1Uo/kUIb22RLprCzvcCp9Po2f72BDEkL97O9LOree1L6liuc1I2qOhYv1
	qejL9V7Rs8Bb52CYfCbAATlLn7MNakf+6eDioFIJugFHJMFOM3o7ffrJsjb8G5BKYNbD
	555K558LkauTXt8jzYGtNlyiSR/xeU1kTCTFHtK9NfLlqbDnl6+MGE8LpVHsWqA2WJRx
	8OJa1KWzOO1UsgTA3znIlKOvNsXWroDN+LHM0eUXmaKtlU3+GrZ4PSRUXYJ4X9qlXfCO
	CdnQ==
X-Gm-Message-State: AODbwcCWWv0jN22nN240thWhle1nVuhIRN8p5izmd+BSjJ3AJQa2F7IE
	R0z9UjaxAy+Dz6lCGCn/yakFeUhbow==
X-Received: by 10.28.173.85 with SMTP id w82mr2645786wme.98.1495553359444;
	Tue, 23 May 2017 08:29:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.128.65 with HTTP; Tue, 23 May 2017 08:29:18 -0700 (PDT)
In-Reply-To: <CAJTo0Lafr6dearC1uiQpumEUHA9ggAC59MhtvFWVvYi-Oc_8TQ@mail.gmail.com>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
	<CAJTo0Lafr6dearC1uiQpumEUHA9ggAC59MhtvFWVvYi-Oc_8TQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 23 May 2017 10:29:18 -0500
Message-ID: <CAJdd5GZeT8h7qXfKF=XM7Q0kKoMgQSxNprqhWz7wYv_vBquzTQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: Atomically generate host keys
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
X-List-Received-Date: Tue, 23 May 2017 15:29:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 9:37 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 7 May 2017 at 02:33, Joshua Watt <jpewhacker@gmail.com> wrote:
>>
>> +if [ ! -f "$NAME" ]; then
>> +    echo "  generating ssh $TYPE key..."
>> +    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
>> +
>> +    # Sync to ensure data is written to temp file before renaming
>> +    sync
>> +
>> +    # Move (Atomically rename) files
>> +    # Rename the .pub file first, since the check that triggers a
>> +    # key generation is based on the private file.
>> +    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
>> +    sync
>> +
>> +    mv -f "${NAME}.tmp" "${NAME}"
>> +    sync
>> +fi
>>
>
> All of these syncs seem quite enthusiastic, are they really needed?  Writing
> the file to a temporary name and then mving it to the real name should
> result in either no file or a complete file in the event of power loss,
> surely?

My understanding (and observation) of most journal file systems is
that only metadata (i.e. directory entries and such) are journaled in
typical usage. The first sync is necessary in this case to ensure that
the actual file data gets put on the disk before we rename the files,
otherwise in the event of interruption journaled rename might get
replayed but have garbage data. The second one is more of a "force
operation order" sync to make sure the public file is written before
the private one, as a reordering would cause problems. The last sync
is the most optional, but I've seen it take minutes for disk to sync
contents if no one calls "sync", so it is very possible that all our
work of regenerating keys would be for naught if power is interrupted
in the meantime.

I think some of these syncs can be removed. Namely, the first and
third one. The second one needs to be there, but can server double
duty of syncing data to disk and enforcing the order between the
public and private rename. It does mean we could get a state where the
public key exists but is garbage, but this should be OK because the
private key won't exist and it would be regenerated.

The third sync can be removed and I can put one final sync at the end
after all keys are generated to ensure we won't go through all the
effort of regenerating the (last) key again in the event of
interruption shortly after, unless you would prefer I didn't.

>
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>> b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>> index 148e6ad..af56404 100644
>> --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>> +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
>> @@ -1,22 +1,14 @@
>>  [Unit]
>>  Description=OpenSSH Key Generation
>>  RequiresMountsFor=/var /run
>> -ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
>> -ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
>> -ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
>> -ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
>> -ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
>> -ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
>> -ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
>> -ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
>
>
> Can you not continue to use ConditionPathExists to only run this unit if it
> needs to run?  You can prepend the argument with | to make them logical OR
> instead of logical AND, if I'm reading this documentation correctly.

I will try that. I wasn't aware that was an option since systemd conf
files are somewhat new to me.

>
> Ross

