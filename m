Received: from mail-vb0-f46.google.com ([209.85.212.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPrQm-0006ny-Mc
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 11:35:07 +0200
Received: by mail-vb0-f46.google.com with SMTP id 11so180983vbe.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 02:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=xNK09pmJZxDMKEjP0wsa5SR+vfaazVDFaraJ5TZCXDs=;
	b=CPqzTTelFLT93EvwPTfX7Fhjgni6QEhBr34nT8x5NvyH6b/PFVq/EOvWpdFgckHoG5
	t6YZdIdbQPEzPG1Ukd4HPLlkil8AtNiOW3bcCTYDcDpJr/X9y8UmVlTvryCjOZmCanfB
	d1Yv+gZxxmvHPnwfBru5pq7lKrKnxZKlo9r+u+9PFLwPT9JafV25EGAXhVWCJ5O8WYXG
	OY5jAkvJk4YJAP2+CT90SqnJb9ll6qvV+beoMClNC9v7wgcSe1DYOo40/xACbz7oZcgk
	l4Bimzql+7ap8frl0OQAOeaWDGTgT/6n/g6G0dPe3hrkfEkaGxdrGJxahOnk5Gqhmqf6
	F0Bw==
X-Received: by 10.58.143.116 with SMTP id sd20mr784666veb.39.1365585461193;
	Wed, 10 Apr 2013 02:17:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 10 Apr 2013 02:17:21 -0700 (PDT)
In-Reply-To: <20130410080012.GA2471@jama>
References: <cover.1365564103.git.wenzong.fan@windriver.com>
	<1365564397-2851-1-git-send-email-wenzong.fan@windriver.com>
	<20130410080012.GA2471@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Apr 2013 10:17:21 +0100
Message-ID: <CAJTo0LauKA1u8koLWXi=XUehoeAAahEeMvafLR7aCq580jDL0w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnCvwceHX4WSN97brLBX80yHAvCnRRx/HLIBuyahzxvus2tJRBU2KQ/DkKjt606w9Uqo33X
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xcursor-transparent-theme: install index.theme explicitly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 09:35:09 -0000
Content-Type: text/plain; charset=UTF-8

On 10 April 2013 09:00, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Apr 10, 2013 at 11:26:35AM +0800, wenzong.fan@windriver.com wrote:
>> The xcursor-transparent-theme doesn't install index.theme by default,
>> this might cause below command fails on target:
>>
>>     $ gtk-update-icon-cache -q /usr/share/icons/xcursor-transparent
>>     Error: "gtk-update-icon-cache: No theme index file"
>>
>> Just install index.theme explicitly to remove those error, its content
>> is from xcursor-transparent-theme's README file.
>
> Wasn't this discussed and fixed before? IIRC the conclusion was that
> postinst should check if there is index.theme or ignore it missing, not
> adding index.theme.

NACK.

Martin is right, the gtk-icon-cache class uses -t when updating the caches:

       --ignore-theme-index, -t
           Don't check for the existence of 'index.theme' in the icon theme
           directory. Without this option, gtk-update-icon-cache refuses to
           create an icon cache in a directory which does not appear to be the
           toplevel directory of an icon theme.

If someone is not using gtk-icon-cache.bbclass they either should, or
have a good reason and also use -t.

Ross


