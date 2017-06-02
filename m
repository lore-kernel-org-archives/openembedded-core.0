Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id C10AE77FF9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 18:33:17 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id e23so793859wre.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 11:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MQLdMJo2drNLPzxhm/zflyuAradkJPARRBIrEGwYMWY=;
	b=VKvOWunIFqD8Ma3AXk5UHkUZHT1lgpvVN3ZwJnL5cGG4LDzInjRJUgTgkACfa4WpA9
	wDrL5L7kjRcGg7ihXoID6hj3cvXutewvkrWT+QLq9n27WhkLDMNAgys5eJpueRqpkkkp
	hqWVuMz1kIh743+TcCYXP7wFt7LEejIUxXTJyLjsQh5LRdhfWZ1wt8TCxn42Ov6BRCpO
	7EHFKd/aTJsVQ0oX7s9vk5F1a43UITVyFgKl+LUNI/CDQ/O30o0um/Q6AiEAXxd3AnBg
	I+97Ua/o603jWTzlZBr01UX5dZcjFwHoYpHOylu1jQSp2IoZKnCotagLnmlVcc733Z8c
	9AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MQLdMJo2drNLPzxhm/zflyuAradkJPARRBIrEGwYMWY=;
	b=bXlELJ6gN70XZDnndC1KmRC8+VI3W/TBaQCRCAm+m/PBBxTyyukKjkwqN9SBVe/PHw
	FkiVsqV+IToT0M8uYuMHt6kea0vigZEAt0zmXG1uGtlu77nEZbGq2ZjCBeKSn24feE9g
	DTQVVYVzXTAekCQK0Gosrh5Ge/zVZ/rB/+P9X3Vn0c4lIDy1gImEc9qH+5oY0/9PNXR1
	Y5Fdckofe76KHXQRrLjIZgnGtbzWcAyXy/+b49ZsrR5Si+AKn5yNVgi/KIksBsu7yQHB
	7a3fL+Llmzr78agevo8jtp7hkildfTXWhIdjMZEb5c0/NjgXsLl6SusLLr9Cks4qLEHD
	fU6Q==
X-Gm-Message-State: AODbwcBUJdEYSX/c9OV8Ubp6uh0RZnnF9a637fhVvVb9+1obejmHHvqA
	RaxGaf4Jfr8OCG0hsk2S4B5YN0eqng==
X-Received: by 10.223.170.67 with SMTP id q3mr7244796wrd.19.1496428398342;
	Fri, 02 Jun 2017 11:33:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.148 with HTTP; Fri, 2 Jun 2017 11:33:17 -0700 (PDT)
In-Reply-To: <299ab56a-9990-70da-3a50-730f1646b232@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<dc21b6be8d46f824831ff9bf4a5055dec3895b6b.1496329361.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=Vgkosu=ubwF62dp8mHhaL7n1nKfSQXi4G1Si5F3J6TfA@mail.gmail.com>
	<299ab56a-9990-70da-3a50-730f1646b232@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 2 Jun 2017 11:33:17 -0700
Message-ID: <CAJ86T=X4pvpH7dsG42hYJecCWGouaW-3Hyo8H6c+1Npc+4Z2EA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] package_rpm.bbclass: use multithreaded xz compression
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
X-List-Received-Date: Fri, 02 Jun 2017 18:33:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 2, 2017 at 4:40 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/01/2017 10:02 PM, Andre McCurdy wrote:
>>>
>>> RPM's default is single-threaded gz; the change greatly helps with
>>> both buildtimes (when there is a small number of large-sized packages)
>>> and disk space taken by resulting rpms.
>>
>> Do you have any test results for that? Obviously build times will be
>> longer when building with a single CPU since xz compression needs more
>> CPU than gzip, but I'm curious how many CPUs are required before the
>> multiple threads win over and build times actually get shorter. 4? 8?
>
> Yes; it's in the cover letter.

Yes, I only saw that after sending my reply. I shouldn't read emails
in reverse order... sorry about that.

The cover letter benchmarks didn't mention the 22 CPU cores though, so
it's good to have that clarified. Seeing some results from a 4 or 8
core machine would be interesting too.

>> One other concern with parallel xz compression is memory usage. Single
>> threaded xz needs more memory than gzip and running multiple xz
>> compression threads together will push the memory usage up again.
>> Maybe not an issue if the peak is still acceptable, but something to
>> be aware of (I've given up trying to build in 4GB, but hopefully 8GB
>> build machines still have some life left in them...).>
>
> I haven't seen anything resembling low-memory or OOM in my testing, even
> when running 44 rpm instances at the same time, each with their own several
> threads, each thread handling a package, and compression for the package
> again being done in a multi-threaded way. But then I have 22 cores and 32G
> RAM here.
>
> So do try the patches please, and report the findings, YMMV.
>
> Alex
>

