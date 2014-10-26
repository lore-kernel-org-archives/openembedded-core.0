Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 08C2B65D3C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 19:37:59 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z60so3048242qgd.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 12:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=MiTL0uvM5rEhCBK5bQ68UNRRYsSKsLzVCu+xhqSaJ/A=;
	b=Cqznh0JK3vJLwmM7yHlsHKzDUUg4Udk5ryisVHVtWxo7f9kARgmlgaNS8hPk3WWq3K
	C+ubGrpxen9hktR+m9Gz5/Kf3HA2N8fv6TIvMk6lji296ni03BN+jiOuRKgmfrZBXqek
	fBzZSKCC6yDFXl6ysDyUlRSaazkSRpDIwPDaweswMehFp1Dw9xrUCV1chB6yt5j2kjBX
	85m+9HGXH9IH86YcuRtD8RV+xCtI7Fkcr2wMTXMIATauhkJ/ZeWEFhgAFDR8fFIes7CV
	S/0yNYD/BabSPDHRl5tfUzb6KVvvBBtx+td8sWYJMW+U81QtS/0/ft6Xb9xtM5RP+JC4
	nQog==
X-Received: by 10.140.23.198 with SMTP id 64mr25226347qgp.62.1414352280082;
	Sun, 26 Oct 2014 12:38:00 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Sun, 26 Oct 2014 12:37:19 -0700 (PDT)
In-Reply-To: <1414352182-30029-1-git-send-email-paul@paulbarker.me.uk>
References: <1414352182-30029-1-git-send-email-paul@paulbarker.me.uk>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 26 Oct 2014 19:37:19 +0000
X-Google-Sender-Auth: iPBH5Zph2SaBpBmJJQTfl3ESZQI
Message-ID: <CANyK_8cVn-EuWaFT3KsAOKP_QoKwcGxE7QSqFNHoe6mQERRcdA@mail.gmail.com>
To: Chris Carr <chris.carr@ge.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_manager: Fix BAD_RECOMMENDATIONS for opkg
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
X-List-Received-Date: Sun, 26 Oct 2014 19:38:00 -0000
Content-Type: text/plain; charset=UTF-8

On 26 October 2014 19:36, Paul Barker <paul@paulbarker.me.uk> wrote:
> In package_manager.py, when using opkg as the packager, the command 'opkg <args>
> info <pkg>' is called to get information about each pkg in BAD_RECOMMENDATIONS
> in a format that can be written to the status file. The 'Status: ...' line is
> modified and all other lines are passed through. Changing the verbosity level
> argument for this command will change what it written into the status file.
> Crucially, with the default verbosity level, no blank lines are being printed by
> the opkg command and so no blank lines are being written to the status file to
> separate each package entry.
>
> The package parsing code in opkg expects package entries in the status file to
> be separated by at least one blank line. If no blank line is seen, the next
> package entry is interpreted as a continuation of the last package entry, but
> the new values overwrite the old values.
>
> So with the default verbosity level, a blank line follows some package entries
> and these are parsed. The others are dropped due to the lack of blank lines. As
> the verbosity increases, more debugging messages add blank lines and more
> packages are parsed.
>
> The solution to ensure that this works correctly regardless of the verbosity
> level is simply add a blank line after the output of 'opkg info' is written to
> the status file, ensuring that the next package is separated from the current
> package.
>
> [YOCTO #6816]
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> Cc: Chris Carr <chris.carr@ge.com>
> ---
>  meta/lib/oe/package_manager.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index ffb83b2..85d7fd4 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -1408,6 +1408,10 @@ class OpkgPM(PackageManager):
>                      else:
>                          status.write(line + "\n")
>
> +                # Append a blank line after each package entry to ensure that it
> +                # is separated from the following entry
> +                status.write("\n")
> +
>      '''
>      The following function dummy installs pkgs and returns the log of output.
>      '''
> --
> 2.1.2
>

Chris, could you give this a test and let us know if it fixes the issue.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

