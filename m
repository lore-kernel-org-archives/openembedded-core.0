Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id AFBDB7E0A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 12:22:26 +0000 (UTC)
Received: by mail-it1-f173.google.com with SMTP id m141so9278151ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N4CooIjLCWoZgWjJ60x/eYNWgtIOZmDP7aQ+WK05DhA=;
	b=TqYreJtGc9mx1B1jHDdiFm6JGmT/q6N2p3dDnbFNWkgJqAVHqL3qgG/u8TuMZAvi8S
	qI8sZ03qSZ4nshM0N5U+41oLCzHbrOMZx2yNnRJqllpHoFOMO5M2s9aFjBp2H9e2so8p
	nq9eKl4bpqiGZOJncOdzUIFO7lWrVIIunyYrMMakKRRqamB4tyLil5AKxLe3H3DgwAm7
	txr/7J5E5BmcWYQocTMD6JfZN2UgF3X8vULIUE5IMEHvdWMfSzAprmBTfH2EYD4HIGbL
	2EPt5YQY3f2j5PH4nNzMTSsjMSjec/G5mKUvnxKM9RWeuyYxKsyE1E+zvIPYN+EXlee7
	izhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N4CooIjLCWoZgWjJ60x/eYNWgtIOZmDP7aQ+WK05DhA=;
	b=sh239yBeA5ptBmUEM7zjApT9AlxXIdZTOrZXu7SBfuP8Z92VphPCLaKOgj95/NQqsE
	BkkzWTz3r72QyRLFqnj2kSQfL09q3LTElXuiNvSvWavA18YLcvLfYAIXhzLD68jjAs3I
	YdyDxjSkWBAGWXZE3gkLdUNZaKCbxT7HasLjZExpG8ZxLWUdyRi2isT3iuD/QbHl6TtW
	5oWn1+y9IhPSVB3fSBQW7YE0FUo/QuzQ4DWinc1RqC2dZaPRw7qXhMy2uWc4HTztaVEH
	wWAbgb1Ae+9RxgoFgs6AWcbQXDmNN5Q6j6zBasS/3sPpKfoI1BmkdeCmpJmqydkAdkk+
	ZvaQ==
X-Gm-Message-State: APjAAAXEyayP1GHijNhillv2znEOSnQSfxy+AmxNA4UVE5Tr7p8CG9VQ
	3mzap2IGypNY/hSdk5vYhh1Ma1n+mgQNccCwjyzdMt50SS0=
X-Google-Smtp-Source: APXvYqyl94oao5GUmsaRdevY8MW0rsTaJEJJ29lO1u4z1M9IjdFXO+BqeJOdQaAd+jM+329rTW0ONlHT9fbqak9F32Q=
X-Received: by 2002:a02:6d0c:: with SMTP id m12mr13838529jac.105.1558614147953;
	Thu, 23 May 2019 05:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190523103352.GA25084@localhost>
In-Reply-To: <20190523103352.GA25084@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 May 2019 13:22:13 +0100
Message-ID: <CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Thu, 23 May 2019 12:22:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 May 2019 at 11:34, Adrian Bunk <bunk@stusta.de> wrote:
> systemd is fundamentally Linux-only and not portable to other kernels.
>
> systemd upstream is using glibc extensions not present in other
> C libraries.
>
> systemd upstream is accepting technically correct patches that help
> building with musl, but there is no interest upstream in keeping systemd
> working with non-glibc C libraries.
>
> The way things currently go, systemd/musl will require an ever-growing
> amount of not upstreamable patches - and this is not sustainable.

I think I have to agree with you: several of the extensions are for
security purposes, so we're potentially actively introducing issues.

Ross

