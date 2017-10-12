Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B924177BC1;
	Thu, 12 Oct 2017 02:30:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9C2U6XM006785
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Oct 2017 19:30:07 -0700 (PDT)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 11 Oct 2017 19:30:06 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <150754017019.10662.17591818165714630277@git.openembedded.org>
	<20171009090930.73387234938@git.openembedded.org>
	<20171012015609.GA3832@jama>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <9a2e5605-88e9-a089-6dd1-37ed5b9471c8@windriver.com>
Date: Thu, 12 Oct 2017 10:36:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20171012015609.GA3832@jama>
X-Originating-IP: [128.224.162.167]
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/01: bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Thu, 12 Oct 2017 02:30:06 -0000
Content-Type: multipart/alternative;
	boundary="------------FC7DAD2636429903243AA631"

--------------FC7DAD2636429903243AA631
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2017 09:56 AM, Martin Jansa wrote:
> On Mon, Oct 09, 2017 at 09:09:31AM +0000, git@git.openembedded.org wrote:
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master
>> in repository openembedded-core.
>>
>> commit 8ca61a5464743ff85b6d26886112750d6ddd13e0
>> Author: Chen Qi <Qi.Chen@windriver.com>
>> AuthorDate: Sat Sep 30 16:15:42 2017 +0800
>>
>>      bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
>>      
>>      Add tools required by testimage to HOSTTOOLS only when testimage is
>>      inherited. These tools, as described in the comment, are only required
>>      by the testimage task. So this change should not have negtive effect.
>>      This would also solve build error on hosts which miss some tool such as scp.
>>      
>>      Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>      Signed-off-by: Ross Burton <ross.burton@intel.com>
>>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/conf/bitbake.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 6f53b23..0eefb86 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -484,7 +484,7 @@ HOSTTOOLS += " \
>>   "
>>   
>>   # Tools needed to run testimage runtime image testing
>> -HOSTTOOLS += "ip ping ps scp ssh stty"
>> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
> Shouldn't we include at least ssh by default?
>
> I have some builds where CONNECTIVITY_CHECK_URIS contains private git repo (to make sure that users
> configured their git + ssh correctly before starting the build) and since this change it fails, because
> of missing ssh:
>
> ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
>      Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>      Following is the list of potential problems / advisories:
>
>      Fetcher failure: Fetch command export PATH="...snip.../hosttools"; export HOME="/home/jenkins"; git -c core.fsyncobjectfiles=0 ls-remote ssh://foo.com/bar/repo  failed with exit code 128, output:
> error: cannot run ssh: No such file or directory
> fatal: unable to fork
> .
>      Please ensure your host's network is configured correctly,
>      or set BB_NO_NETWORK = "1" to disable network access if
>      all required sources are on local disk.
>
> I know I can add ssh locally, but do we really need to be so strict
> here? We already include git and git might need ssh.
>
> Regards,

Hi Martin,

The problem is mainly about documentation. We need to keep codes and 
docs in sync.

We have in our documentation (QuickStart) a list of software necessary 
to use basic yocto functionality.

e.g.

/Ubuntu and Debian/

      $ sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
      build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping libsdl1.2-dev xterm
                         


I have hosts that only have the above packages installed. Thus I was 
meeting error when trying to build something, as ssh and scp are not 
available.

I'm OK with adding ssh into default HOSTTOOLS, but we need to keep 
documentation in sync with the codes. (e.g. adding openssh-client into 
the above list.)

Best Regards,
Chen Qi

>>   # Link to these if present
>>   HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
>>
>> -- 
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> -- 
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits



--------------FC7DAD2636429903243AA631
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 10/12/2017 09:56 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote cite="mid:20171012015609.GA3832@jama" type="cite">
      <pre wrap="">On Mon, Oct 09, 2017 at 09:09:31AM +0000, <a class="moz-txt-link-abbreviated" href="mailto:git@git.openembedded.org">git@git.openembedded.org</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">This is an automated email from the git hooks/post-receive script.

rpurdie pushed a commit to branch master
in repository openembedded-core.

commit 8ca61a5464743ff85b6d26886112750d6ddd13e0
Author: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
AuthorDate: Sat Sep 30 16:15:42 2017 +0800

    bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
    
    Add tools required by testimage to HOSTTOOLS only when testimage is
    inherited. These tools, as described in the comment, are only required
    by the testimage task. So this change should not have negtive effect.
    This would also solve build error on hosts which miss some tool such as scp.
    
    Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
    Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
    Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6f53b23..0eefb86 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -484,7 +484,7 @@ HOSTTOOLS += " \
 "
 
 # Tools needed to run testimage runtime image testing
-HOSTTOOLS += "ip ping ps scp ssh stty"
+HOSTTOOLS += <a class="moz-txt-link-rfc2396E" href="mailto:${@['','ippingpsscpsshstty'][bb.data.inherits_class('testimage',d)]}">"${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"</a>
</pre>
      </blockquote>
      <pre wrap="">
Shouldn't we include at least ssh by default?

I have some builds where CONNECTIVITY_CHECK_URIS contains private git repo (to make sure that users
configured their git + ssh correctly before starting the build) and since this change it fails, because
of missing ssh:

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Fetcher failure: Fetch command export PATH="...snip.../hosttools"; export HOME="/home/jenkins"; git -c core.fsyncobjectfiles=0 ls-remote ssh://foo.com/bar/repo  failed with exit code 128, output:
error: cannot run ssh: No such file or directory
fatal: unable to fork
.
    Please ensure your host's network is configured correctly,
    or set BB_NO_NETWORK = "1" to disable network access if
    all required sources are on local disk.

I know I can add ssh locally, but do we really need to be so strict
here? We already include git and git might need ssh.

Regards,
</pre>
    </blockquote>
    <br>
    Hi Martin,<br>
    <br>
    The problem is mainly about documentation. We need to keep codes and
    docs in sync.<br>
    <br>
    We have in our documentation (QuickStart) a list of software
    necessary to use basic yocto functionality.<br>
    <br>
    e.g.<br>
    <br>
    <p><span class="emphasis"><em>Ubuntu and Debian</em></span> </p>
    <pre class="literallayout">     $ sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping libsdl1.2-dev xterm
                        </pre>
    <br>
    I have hosts that only have the above packages installed. Thus I was
    meeting error when trying to build something, as ssh and scp are not
    available.<br>
    <br>
    I'm OK with adding ssh into default HOSTTOOLS, but we need to keep
    documentation in sync with the codes. (e.g. adding openssh-client
    into the above list.)<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:20171012015609.GA3832@jama" type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap=""> # Link to these if present
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"

-- 
To stop receiving notification emails like this one, please contact
the administrator of this repository.
-- 
_______________________________________________
Openembedded-commits mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-commits@lists.openembedded.org">Openembedded-commits@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-commits">http://lists.openembedded.org/mailman/listinfo/openembedded-commits</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------FC7DAD2636429903243AA631--
