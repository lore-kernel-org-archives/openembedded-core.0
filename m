Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2mKB-0006d5-Sk
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:28:53 +0100
Received: by mail-ia0-f175.google.com with SMTP id r4so400899iaj.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=datr/rhJBzqHLiLkjP8G4SnT9u1BhASVtCF63OW2y8c=;
	b=wuUDO5DMLCj6XrtXDbDTk8apVR0oSdyP3Pc4zKkr2hN+lgI4dKMzypZhE0eZ2Y4Pdf
	S4GdkGOPpD3g9fH7pG8T+byIKMw5whW856q2uA6NGPj7i2K5gDeZH8dNOY6YTWSHlHGW
	o3O0x9gANoGWDY4YimDAt4yQXUK+NBlpzz/f4x180aWSRe+vogpk+80mN8A9+QBtvvxd
	LqZKF1+EMqsktO3xS1DKU0EskNM6bm2Mm1MGXXzJILZoK8rRS9KuykmOUblmPdxfp8Jd
	dIyMXbRjKvlEX6qzxbfDkm4jvdbtRqJlAaCxsnVOaqm1zX3ZwwrKblL/U5eZVtcBFXCt
	6S9w==
MIME-Version: 1.0
X-Received: by 10.50.214.68 with SMTP id ny4mr14738034igc.65.1360084381445;
	Tue, 05 Feb 2013 09:13:01 -0800 (PST)
Received: by 10.64.143.228 with HTTP; Tue, 5 Feb 2013 09:13:01 -0800 (PST)
In-Reply-To: <5111374E.1050802@linux.intel.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
	<5111374E.1050802@linux.intel.com>
Date: Tue, 5 Feb 2013 18:13:01 +0100
Message-ID: <CAC1BbcS3WTFO+UHKc-ZKL0ba2v4=mhW0Co2JdOVj-ryYsWm71w@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] Revert "Add ptest for glib."
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
X-List-Received-Date: Tue, 05 Feb 2013 17:28:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 5 February 2013 17:46, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/05/2013 07:55 AM, Bernhard Reutner-Fischer wrote:
>>
>> This reverts commit dec6f912d68f52748f645b6af411f189cf464f85.
>>
>> This breaks core-image-sato-sdk for TCLIBC="uclibc".
>>
> What's the issue?  Is it fixable instead of reverting the ptest patch? I

The issue is that it incorrectly and unconditionally pulls in eglibc stuff:

-RDEPENDS_${PN}-ptest += "\
-            eglibc-gconv-utf-16 \
-            eglibc-charmap-utf-8 \
-            eglibc-gconv-cp1255 \
-            eglibc-charmap-cp1255 \
-            eglibc-gconv-utf-32 \
-            eglibc-gconv-utf-7 \
-            eglibc-charmap-invariant \
-            eglibc-localedata-translit-cjk-variants \
-            tzdata \
-            tzdata-americas \
-            tzdata-asia \
-            tzdata-europe \
-            tzdata-posix \
-            python-pygobject \
-            python-dbus \
-           "

> think this would be the wrong approach to this kind of issue as we want to
> expand the usage of ptest.


