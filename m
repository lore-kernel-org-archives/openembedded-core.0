Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 635E87258B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 12:41:28 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id i138so24304528oig.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 04:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YIibnoDcD5MyY/iEHDeRlHKY8skb8Y0xK0IMUSiJwrQ=;
	b=f4qsUuIkFlH2Gr4jMP3krhSMilcCfpqlIg3bieokm/KA4CK/mqeiIxcK2HlJ7j2+xe
	k9gWxZKli0+qAIJQH+JCsWb/WGn21lL6aMqcXN/+zTDIEUiBn65gINhVbe3XRgeKLAHM
	9Pf9/cGctbl8nzOSWOMXLl4HyAuntLPZdjhGkz/Q+//IrcMn6XjyOHHUjSs23bn5jWVV
	7OPOlp8rRABmqv6LRW5autQVJTWbL3D7nMNeGGy6sCtr0EhXovZmNrqVtVpuSTMzE+hJ
	wLXDBoqeBOKgOp3yoBbqbPMG+AT5apBgwkFLTEZe4rHE8YXlyRtyzc5QvjvjNNbRE3Ze
	k2Yg==
X-Gm-Message-State: ALoCoQkRyXN+js96WdmSeHkdyS/v2FZ6Q0e+THHdZohdhtFJ+dtySpmoAZdwDHTjKhRzZTaIE5WU
X-Received: by 10.202.213.144 with SMTP id m138mr30529603oig.87.1419856888702; 
	Mon, 29 Dec 2014 04:41:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.130 with HTTP; Mon, 29 Dec 2014 04:41:08 -0800 (PST)
In-Reply-To: <1419846408-31247-1-git-send-email-awais_belal@mentor.com>
References: <1419846408-31247-1-git-send-email-awais_belal@mentor.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 29 Dec 2014 13:41:08 +0100
Message-ID: <CAP71WjzrFn=W8QYoDQybKyLxEpi4zL6yN8xkFZK=ze-6YZ_rLw@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-omx: use mulitple SCMs to fetch submodules
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
X-List-Received-Date: Mon, 29 Dec 2014 12:41:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 29, 2014 at 10:46 AM, Awais Belal <awais_belal@mentor.com> wrote:
> The gstreamer omx package uses a submodule 'common' which
> is fetched by the configure script. This approach fails
> on non-network builds as the fetcher tries to look upstream
> for the submodule.
> We now use multiple SCMs, one for the main omx package and
> the other for the 'common' submodule so it is available in
> the downloads_dir for later use.
>

we have the same issues with all the others gstreamer1.0-*_git.bb
recipes, don't we? maybe we should fix them all. i am not sure if
there is a nice way to do it for all recipes, like with a .inc file,
to avoid duplication..

also, the autogen.sh script will still run git submodule update, even
if the 'common' folder already exist, so we will need to be extra
careful when upgrading the _git.bb recipes to update both
SRCREV_gst-omx and SRCREV_common or we will have the same issue
again..

