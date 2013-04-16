Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1US56Y-0007Jw-43
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 14:35:25 +0200
Received: by mail-vc0-f169.google.com with SMTP id hx10so322712vcb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=P8xRbiDVEb7M0hB92k60qC3ktA9jhYm7Iw9rWrMkq/g=;
	b=XHrFRGXPkM2L7X/lJiS4Nh5agiV+PYJOZNABKbVk5fE6DPhm7n70vKouF+eEpGoFYo
	MQLDWlUcfSjQ6pZJ+NGk6WO7EqjoTSuAhHTk+R1vdQoiGxCfgXO7yOUUwPS26b+kfR1U
	trJDDHSzHanqGr1EtkE/gtKs/qIahOkVNus8SOtTczK0UMDtdywxw5PgPy7UOARq23ig
	pwcNFNNYRyAGqQsAcjUVt9fgJFyhZtlHVYX2cOk2GVVe/3/BGpIcGNR0nY3xi8lZpf4I
	ZYXVLJX+VKTsWk6WAs597VEPYQ/ZRhtKGXyy5sTqzRdCrzPq8rvwTjAZbmA4o9LHLjNx
	a3lA==
MIME-Version: 1.0
X-Received: by 10.58.50.7 with SMTP id y7mr1332904ven.24.1366114671644; Tue,
	16 Apr 2013 05:17:51 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Tue, 16 Apr 2013 05:17:51 -0700 (PDT)
In-Reply-To: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
References: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
Date: Tue, 16 Apr 2013 14:17:51 +0200
Message-ID: <CALbNGRQM15TSn5M52Bk0SuadUOEMN2f8qM0RHV3rBTL4jRbUQA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: experiences with images based on current layer heads
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
X-List-Received-Date: Tue, 16 Apr 2013 12:35:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2013 at 4:02 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> when migration of systemd to oe-core turned to unbuildable I decided
> to freeze my images and stopped further tests. Now that many issues
> were fixed and we are close to another release I built my standard
> xfce-based image based on latest layer HEADs. With this I face some
> issues which I would like to share:
>
> 1. X sessions crash with OOM. This is reproducible by opening
> google-maps with midori and changing to satellite view. In
> Xorg.0.log.old I see only
>
> | (EE)
> | (EE) Backtrace:
> | (EE)
> | (EE) Segmentation fault at address 0x9
> | (EE) BUG: triggered 'if (inSignalContext)'
> | (EE) BUG: log.c:502 in LogVMessageVerb()
> | (EE) Warning: attempting to log data in a signal unsafe manner while
> in signal context.
> | Please update to check inSignalContext and/or use
> LogMessageVerbSigSafe() or ErrorFSigSafe().
> | The offending log format message is:
> |
> | Fatal server error:
> |
> | (EE)
> | (EE) Backtrace:
> | (EE)

Seems I found this one: it is caused by undefined signedness for char.
ARM uses unsigned by default but in the code we find

if (pClient->smart_priority < 0)

After final tests and sending upstream I'll send a patch here.

Andreas


