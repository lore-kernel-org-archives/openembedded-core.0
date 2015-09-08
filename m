Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8143B65CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 18:10:15 +0000 (UTC)
Received: by igxx6 with SMTP id x6so22879402igx.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 11:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FlbcOfBohpU/bE9mdGJT/0IMKGk/XPoeNT0l0SAvtS4=;
	b=M2gSa3ODZXY4/Iy0CDMqJAzHQuI9Qc/BlHr9AlzIOxtdWuz0yQ/nvisCrVO21cSquv
	HVoAwtUZBJMVZiV2O56LPt2xL9QStiVpWf7DAjYFRGgZrZJX/F8TD7F3X53gKodtBZC8
	orFtwoOZ4lnjYLNQLYAM71ex9J1lYtnk3CJ9OcM0GyawM4KC7wK0VeCdCK+KEsrM0fhR
	6pgs9iCljCSeTnFZZUt6QnH/Eg9ko09XrmEL3nSaVIPq8nPOQY8oS0LBcV++e/IIF6Qk
	e8IBy0KPR6YXTlb4ZWpRtiXVEBwhQpo0yS+w+5gBqDN9ZESb4rMT2ggYBj8v3x1PzSO/
	Y5bw==
X-Received: by 10.50.117.100 with SMTP id kd4mr41147833igb.75.1441735815862;
	Tue, 08 Sep 2015 11:10:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Tue, 8 Sep 2015 11:09:46 -0700 (PDT)
In-Reply-To: <1441654013.24871.259.camel@linuxfoundation.org>
References: <cover.1441552859.git.raj.khem@gmail.com>
	<1441654013.24871.259.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Sep 2015 11:09:46 -0700
Message-ID: <CAMKF1soBdYHWVPKHhgN8GR02xn=0CEPZTUB_Njft3YtG+UMkbA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Tue, 08 Sep 2015 18:10:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 7, 2015 at 12:26 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
>> Changes Since last time
>> - Now that 225 is out upgrade recipe to 225, changes between 224 and 225 are minor
>>   but fixes in networkd are important
>> - Implement systemd-sysv-install for OE
>> - Enable getopt in busybox needed for systemd-sysv-install
>> - Remove update-rc.d from default uninstall list in rootfs creation
>> - Tested date and systemd unit tests manually to pass
>> - Booted core-image-cmdline-full on all qemu targets
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/480
>
> The date test failed in two of the sanity runs with this series
> applied :(


I am able to reproduce this now and also analyse it. Its a timing
issue and original testcase needs to be changed.
The root cause is that we have systemd-timesyncd started automatically on boot
( we always had) so when we changed the date and asked for the date
immediately we got it before timesyncd came around
and readjusted it to network time.

happens with

SSH="ssh root@192.168.7.2"
$SSH 'date +"%Y-%m-%d %T"'
$SSH 'date -s "2016-08-09 10:00:00"'
$SSH 'date -R'

Fixed with

SSH="ssh root@192.168.7.2"
$SSH 'systemctl stop systemd-timesyncd'
$SSH 'date +"%Y-%m-%d %T"'
$SSH 'date -s "2016-08-09 10:00:00"'
$SSH 'date -R'
$SSH 'systemctl start systemd-timesyncd'


this patch fixed it during autoruns, but date test is common for
sysvint and systemd it ignores the outputs of systemctl cmds
so in theory it will work on both sysvinit and systemd. Although its not elegant

diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py
index 97e8ee4..f73ad1c 100644
--- a/meta/lib/oeqa/runtime/date.py
+++ b/meta/lib/oeqa/runtime/date.py
@@ -7,6 +7,7 @@ class DateTest(oeRuntimeTest):
    @testcase(211)
    @skipUnlessPassed("test_ssh")
    def test_date(self):
+        (status, output) = self.target.run('systemctl stop systemd-timesyncd')
        (status, output) = self.target.run('date +"%Y-%m-%d %T"')
        self.assertEqual(status, 0, msg="Failed to get initial date,
output: %s" % output)
        oldDate = output
@@ -21,3 +22,4 @@ class DateTest(oeRuntimeTest):

        (status, output) = self.target.run('date -s "%s"' % oldDate)
        self.assertEqual(status, 0, msg="Failed to reset date, output:
%s" % output)
+        (status, output) = self.target.run('systemctl start systemd-timesyncd')



>
> Cheers,
>
> Richard
>

