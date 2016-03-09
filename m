Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 255B16FFE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 21:30:32 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id x1so84726063lbj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 13:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UwIIEGqXTip6pzrQx+ZLZGmdamGCUHW+gOu3rt1yKYU=;
	b=NE3qVjLKv+TnYzwqnuxmivXy7AR/MZjGGy4Jcbsimc8vZPXEFkr6UOPhD8G1ySdHAE
	YnEc8LX5aeQxUaYhX9q3AQ5CNvXev9lKgnxlSxVMrKOAmJ1JbafJNuCG2WrdFwT39o+M
	mqpWDNvikWuvwrYCVqZm/EHG3lC69gXQGxE1GsVsQ52gR0G6IJzXlUor0xl7UH1BLk+h
	02ux2EeJKK3mZfIPfC9yoE4yrdBD+TJTNrH5kLNtQfAyKBMMzDGyz/TG7myOn8g8F92y
	DtzR8/0hkLWfzgfYnhXOeCf6i4uNWqIEzL71is8CKxRZVUW5lE8c9qE9ErWPd2msieMa
	Bmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UwIIEGqXTip6pzrQx+ZLZGmdamGCUHW+gOu3rt1yKYU=;
	b=bqMBhbOvILh6mupI0y/JB03DXTu8lKlODMAWrIfsHHPedKEeNWSNVS7xU3s1M8o1Tw
	/MKmD/ri7gMX0c9PMIxX9ZYOlLEzy6q1dveVkHw/H6BH/TQTjynItPUYHgIkSEmlo8r4
	0o8Lw+Gj0VW9xen12/oqPY0vNEHaeR7Dt6zVyZsNgR1SnF/KWJ+Sa/1W1emnYxPCVphy
	i77A03gl12BjkQlhbrJU9BuBKR6TBZQTnB+XCYoyqHjytPXaoAMLKq9+WUlgs9KBHzy5
	MXI634AIaxf9SMu/PggeAT9Y3eFnTD0VVJX6L59ZQkTfqZLfWF+s3JjMNod5ErKMCTqW
	LYMw==
X-Gm-Message-State: AD7BkJIqq6MMEf2ZtfFqo3bFUEuXepigvkoxjwRHHOujDebQGvUANefseFW4pv9uHq0+T5r3uWQwT1B70QlQEA==
X-Received: by 10.112.126.162 with SMTP id mz2mr132713lbb.71.1457559032543;
	Wed, 09 Mar 2016 13:30:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.109.68 with HTTP; Wed, 9 Mar 2016 13:30:12 -0800 (PST)
In-Reply-To: <56E09545.6020602@windriver.com>
References: <1457547560-21542-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJTo0LYeOMKtvdZb2_Nc55Ti+mrbsjFdOEem-mAC+5N5gVt0fQ@mail.gmail.com>
	<56E09460.9070105@windriver.com> <56E09545.6020602@windriver.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 9 Mar 2016 22:30:12 +0100
Message-ID: <CAPybu_1s+9P0cL=Tic9QE4z8zioVbgdqmgkgYfohKsjHSO1CFQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package-deb: Ignore circular dependencies
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
X-List-Received-Date: Wed, 09 Mar 2016 21:30:33 -0000
Content-Type: text/plain; charset=UTF-8

Hi Mark

On Wed, Mar 9, 2016 at 10:27 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> Just wanted to clarify the above.  RPM -does- support self-referencing
> dependencies.  Circular dependencies are different, in that A -> B -> C -> A..
> those are detected and there is some basic logic to break those.

So if I got it right you are in favour of breaking A->A dependency in
package_deb.class like is done in this patch?

Thanks and best regards!

