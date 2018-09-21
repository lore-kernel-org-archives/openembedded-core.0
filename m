Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
	[209.85.210.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA3F798AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 15:05:59 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 36-v6so13283166oth.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zVK29Vs0N3UOHWWPBXuZIpFRkEiws8rV0viZm0uiaD8=;
	b=Uc8HG1sgZ9tQ7BcrsvrPUzKHb1rYcU3mQmcfsscCagQ/ecZtfXj51j3z2dZOmCrawK
	VnqmwuoEnBfi6OBhsiDTd1sKYDss2kGj6FXjtpM9wKCUGr8tyMp4D/HBHPZnYtqvMQFi
	9VjwmYHMs+SEdXmNHt5d/ffp6geh5sJqEPdTXhP0TFG5sd7jaKbdASQLtciPlf96k2TM
	wK9GLNDUHNRAJ5uaKhENi6PRcbpVH5n5GQcKC4L8skWY0ayBIYmm+tuGX7i4YhmNk6PJ
	mZLvjQMPUJttRHZ63Q6nNtCj2kp7kBIH25j/xa6/r+yZVffJVrG7RrnH7YIoqh9c9pL5
	HHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zVK29Vs0N3UOHWWPBXuZIpFRkEiws8rV0viZm0uiaD8=;
	b=K0dlHn2DB8GvllBB8qso85nFU2owM0ynr+iWvEf3f5oFprcD/UElamJrXoXj22xf+i
	jqM1hjVHWfGgKruegNjm6WbrVUjwgaGIF8RzdFhGtJOsszK5fZD8Jij6UopWMt5tuY5S
	/Lcuzxbu0QHGXuRFBBe4Yv5uQyeAyTM27rXp+emFVhZIe84B4h7n+tBNLTOSI7BE2e19
	d1yrRdfKeXZD3bnT3Anhq44Tc5IWStEHN1aM9e/6ELL1kpSV66Cx818w929irTqB6F/s
	8Hds+eelH9fpv7aVD6/PoMuogFRSU153pQg2npZYqYrCVRXDpZ4W2kChkrjWsYxhDTBO
	OJ3w==
X-Gm-Message-State: APzg51CMCyhtRRE071obrj4HBzsez+GiI4KpJU5lFbX0AxmOw6PSQBc4
	qKwmhClWnE4TZDyE/hPpVLwz6eBEBaUsPYu3bLw3dQ==
X-Google-Smtp-Source: ANB0VdaKFyoSCgrz/dldGJ7NDIBOVzzwXxUHC62FlmV8Yio4YEc26tXyL5tTf2qwomnHeUZDEXW06HrLJtRO7/5SU9o=
X-Received: by 2002:a9d:2253:: with SMTP id
	o77-v6mr27326514ota.204.1537542359986; 
	Fri, 21 Sep 2018 08:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1537497265.git.Qi.Chen@windriver.com>
	<ea5c83494de6b425efc4e2307adcd2896064bf91.1537497265.git.Qi.Chen@windriver.com>
In-Reply-To: <ea5c83494de6b425efc4e2307adcd2896064bf91.1537497265.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Sep 2018 16:05:48 +0100
Message-ID: <CAJTo0LZFmDATTU-a9PDV40kfRrReWG1q928fmSFQvk4PRMNk8w@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] runqemu: fix handling of SIGTERM and the problem of line wrapping
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
X-List-Received-Date: Fri, 21 Sep 2018 15:06:01 -0000
Content-Type: text/plain; charset="UTF-8"

Is there a good reason why shell=True is used in the first place?
Just change the cmd to a list, stop passing shell=True, and you don't
need to dance around process groups.

Ross
On Fri, 21 Sep 2018 at 03:30, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> The current handling of SIGTERM is incorrect as the process pid returned
> by Popen call with shell setting to True is actualy the shell instead of
> the qemu binary. So fix to send SIGTERM to the process group of runqemu.
> This ensures that all processes in the same process group, including the
> shell and the qemu process, will receive SIGTERM.
>
> Also, as we install a SIGTERM handler, we need handle the situation of
> qemu terminated by SIGTERM, otherwise we will get ERROR message in such
> case.
>
> Besides, we have a problem that after running qemu, the terminal's behavior
> is incorrect regarding long lines or long commands. Long commands or long
> outputs should appear in multiple lines, but they appear in the same line,
> overriding previous output. Use `tput smam' to fix this problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/runqemu | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 409d17c..bc2aba5 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1213,9 +1213,12 @@ class BaseConfig(object):
>          cmd = "%s %s" % (self.qemu_opt, kernel_opts)
>          logger.info('Running %s\n' % cmd)
>          process = subprocess.Popen(cmd, shell=True, stderr=subprocess.PIPE)
> -        self.qemupid = process.pid
> -        if process.wait():
> -            logger.error("Failed to run qemu: %s", process.stderr.read().decode())
> +        retcode = process.wait()
> +        if retcode:
> +            if retcode == -signal.SIGTERM:
> +                logger.info("Qemu terminated by SIGTERM")
> +            else:
> +                logger.error("Failed to run qemu: %s", process.stderr.read().decode())
>
>      def cleanup(self):
>          if self.cleaned:
> @@ -1308,8 +1311,10 @@ def main():
>
>          def sigterm_handler(signum, frame):
>              logger.info("SIGTERM received")
> -            os.kill(config.qemupid, signal.SIGTERM)
> +            signal.signal(signal.SIGTERM, signal.SIG_IGN)
> +            os.kill(0, signal.SIGTERM)
>              config.cleanup()
> +            subprocess.run(["tput", "smam"])
>          signal.signal(signal.SIGTERM, sigterm_handler)
>
>          config.check_args()
> @@ -1331,6 +1336,7 @@ def main():
>          return 1
>      finally:
>          config.cleanup()
> +        subprocess.run(["tput", "smam"])
>
>  if __name__ == "__main__":
>      sys.exit(main())
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

