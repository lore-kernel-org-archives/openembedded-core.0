Return-Path: <max.oss.09@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id D12C9607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 13:00:15 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id w10so78158819oif.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 06:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bQAqV66560IX6/CSWx5a8hM4qIjUdweAeGtiu1KqQ6g=;
	b=DNIllQbCbPH2OfM9HRdWTSQMMFLMwK2vE+h3DSIDOWaP4WGbGqAftegTlfRzASP40I
	gABZ98CMdSfD3INCmZ+ccdf1ySkPGNkQ8Smd6y0rTa3I/hVKWk7R5GlnOydD0MDkMiC0
	Ixqk1oIo0f+5ysjAx1GOOQe0WTyy8Cscfe5ZYaXAmjj7pQTMaQcdgowjfcHy8oIErCDq
	96nfekNm/hqGqgyc8XihspBmwqAydB5dykQ+uGpivcNZFTVnrqtfM1TPNqAL16vwnrjF
	tsu7p0TnjCo9/g9lSxhXbOTN2pPfSQaCywqUlYRHby0YdZlh52EvWN/IX02FM59hZF6x
	szLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bQAqV66560IX6/CSWx5a8hM4qIjUdweAeGtiu1KqQ6g=;
	b=h4Q+o4G4O0ah+PDEFIbtx56N7hcqYy3MHNMpdRBi+/q+IvDdnGv0p+wMQEZJ7i3p+k
	/biWQzTJGwh2pf5TU5ZB1qfkIYLQOdZsSCUIiWVghtM6YeHLdWqSCQ4xo4XR4PlpS/60
	V9tr5j+z0pDDLFXx6LayBJQV9dMYH8NQjmhc+qyMP+SjrJl5q99w4a7NqcwmsUXSVjUp
	rft0St5ghIdHfLHjr1eLO1EsQamxylBhItl+ddDA5bYey6Ut3siiP5jgkRVuxZph0YNO
	EsXYUAgXgL0LQvRbo9FNMmacF2OJpieAy+qjrbgwKUsBqik7gQ6UoYXY/8deE72bia0b
	4Ctw==
X-Gm-Message-State: AODbwcA9EVVZSz5hCMyHndu3eposGoMcu1zd47rDIDXdA73nNTjuUWWz
	f+f8DEAfsZvudgjgtfNGHMIu/n+6Yg==
X-Received: by 10.157.17.97 with SMTP id p30mr8168949otp.233.1496062816438;
	Mon, 29 May 2017 06:00:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.84.7 with HTTP; Mon, 29 May 2017 06:00:16 -0700 (PDT)
In-Reply-To: <cf075667-da8d-6b04-8cbb-a39fd3c0fcfa@linux.intel.com>
References: <20170526203537.30721-1-max.krummenacher@toradex.com>
	<cf075667-da8d-6b04-8cbb-a39fd3c0fcfa@linux.intel.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 29 May 2017 15:00:16 +0200
Message-ID: <CAEHkU3VWN7gwy1pZYK6izb5V6kr6=s+9fCymb+Px==ZLRZi6-g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Mon, 29 May 2017 13:00:16 -0000
Content-Type: text/plain; charset="UTF-8"

2017-05-29 12:50 GMT+02:00 Alexander Kanavin
<alexander.kanavin@linux.intel.com>:
> On 05/26/2017 11:35 PM, Max Krummenacher wrote:
>>
>> +-  # check if rpm contains a bundled berkeley db
>> +-  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H)
>> ++  set(HAVE_RPM_DB_H 0)
>
>
> Have you looked into what CHECK_INCLUDE_FILE does, and whether it can be
> fixed? I'd like to hear about your findings.

Yes, I did.

I creates a c file and tries to compile it with the CFLAGS specified
in CMaketext.

<<<<<<<<
#include "rpm/db.h"
int main () {
return 0;
}
>>>>>>>>

As we're talking about libsolv-native here it uses the build host's
gcc which has the standard include directory
/usr/include and thus finds a /usr/include/rpm/db.h

And again, I do not think that it is an error to find/use headers from
the build host's /usr/include for a *-native
build.

Max

