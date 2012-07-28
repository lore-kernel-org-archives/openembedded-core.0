Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Sv3Bb-0007UA-2v
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 11:19:48 +0200
Received: from localhost ([127.0.0.1]:48359 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Sv30P-00070R-NM
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 09:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=4TsgeoFWwvOUGx0J2Csrr8ib8FY=; b=UddYVgTzyRgR8Z/em18A9gw8F/uK
	6kF/sQQDlKtSly36zn/5lilBKW8DRazphsKGnFS9hkv8MhsXrrF4vcVmsD5kCgbg
	HPfnv27rzYC1mSrGD0k+tTJ1BWredJsKKXkiw33/KQVm8+wJ8CIRpuyllFI7WJ4l
	muuwt2X641RrbLg=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:49220 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1Sv2vZ-0006vj-IR for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 09:03:13 +0000
Message-ID: <5013AACF.2010807@communistcode.co.uk>
Date: Sat, 28 Jul 2012 10:03:11 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343307951.29991.27.camel@ted>
In-Reply-To: <1343307951.29991.27.camel@ted>
Subject: Re: [PATCH] lib/oe/lsb: Add basic LSB functions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Jul 2012 09:19:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/2012 14:05, Richard Purdie wrote:
> This code was written by Christopher Larson <chris_larson@mentor.com> and
> allows generation of the LSB release data based upon the lsb_release
> command. It also includes a helper function to generate a string
> representing a given distribution.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
> new file mode 100644
> index 0000000..a774169
> --- a/dev/null
> +++ b/meta/lib/oe/lsb.py
> @@ -0,0 +1,28 @@
> +def release_dict():
> +    """Return the output of lsb_release -a as a dictionary"""
> +    from subprocess import PIPE
> +
> +    try:
> +        output, err = bb.process.run(['lsb_release', '-a'], stderr=PIPE)
> +    except bb.process.CmdError as exc:
> +        return
> +
> +    data = {}
> +    for line in output.splitlines():
> +        try:
> +            key, value = line.split(":\t", 1)
> +        except ValueError:
> +            continue
> +        else:
> +            data[key] = value
> +    return data
> +
> +def distro_identifier(adjust_hook=None):
> +    """Return a distro identifier string based upon lsb_release -ri,
> +       with optional adjustment via a hook"""
> +
> +    lsb_data = release_dict()
> +    distro_id, release = lsb_data['Distributor ID'], lsb_data['Release']
> +    if adjust_hook:
> +        distro_id, release = adjust_hook(distro_id, release)
> +    return '{0}-{1}'.format(distro_id, release)
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

There is an unchecked error case here. I just had to fix this issue:

ERROR: Execution of event handler 'oe_import_eh' failed
Traceback (most recent call last):
   File "oe_import_eh(e)", line 4, in 
oe_import_eh(e=<bb.event.ConfigParsed object at 0x3834f90>)
   File "/mnt/yocto/poky.git/meta/lib/oe/lsb.py", line 25, in 
distro_identifier(adjust_hook=None):
          lsb_data = release_dict()
     >    distro_id, release = lsb_data['Distributor ID'], 
lsb_data['Release']
          if adjust_hook:
TypeError: 'NoneType' object has no attribute '__getitem__'


by installing lsb_release. Archlinux 64.

Should it check to see if it installed first and error otherwise? It 
looks like it tries to do it here:

+    try:
+        output, err = bb.process.run(['lsb_release', '-a'], stderr=PIPE)
+    except bb.process.CmdError as exc:
+        return


but it must be missing something.

Regards,
Jack


