Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web12.3226.1631236351819474045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 18:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [10.200.20.196] (unknown [10.200.20.196])
	by smtp0.taitradio.net (Postfix) with ESMTP id 151C2E00B3;
	Fri, 10 Sep 2021 13:12:29 +1200 (NZST)
Subject: Re: [OE-core][PATCH 2/2] reproducible_build: Work with externalsrc
To: Mark Hatle <mghatle@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210909025100.119427-1-mark.hatle@kernel.crashing.org>
 <20210909025100.119427-3-mark.hatle@kernel.crashing.org>
 <235933db-29d9-02d1-e5b0-e6fc72715335@taitradio.com>
 <796dd7e7-6a0d-a585-7765-bb5621db6128@gmail.com>
From: "Douglas" <douglas.royds@taitradio.com>
Message-ID: <cf3d4bc8-b4b2-7ffc-2e0a-044074fdcf77@taitradio.com>
Date: Fri, 10 Sep 2021 13:12:28 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <796dd7e7-6a0d-a585-7765-bb5621db6128@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------177875C2F32945B886580278"
Content-Language: en-GB

--------------177875C2F32945B886580278
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/21 1:05 pm, Mark Hatle wrote:
> Unfortunately I'm having problems sending email to the list currently.  But I
> can reply directly (feels free to forward this to the list).
>
> On 9/9/21 7:32 PM, Douglas Royds wrote:
>> On 9/09/21 2:51 pm, Mark Hatle wrote:
>>> From: Mark Hatle <mark.hatle@xilinx.com>
>>>
>>> Externalsrc removes do_fetch, do_unpack, and do_patch.  The system normally
>>> discovers the correct reproducible date as a postfuncs on do_unpack, so this
>>> date is never found, so it goes back to the default epoch.
>>>
>>> Instead we can move the discovery function to a prefuncs on the epoch
>>> deploy task.  This task will run before do_configure, and since the source
>>> is already available can run anytime safely.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
>>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>>> ---
>>>   meta/classes/reproducible_build.bbclass | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
>>> index a9c117c3b9..ae0723ab21 100644
>>> --- a/meta/classes/reproducible_build.bbclass
>>> +++ b/meta/classes/reproducible_build.bbclass
>>> @@ -128,7 +128,13 @@ BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
>>>   python () {
>>>       if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
>>>           # Generate the timestamp with create_source_date_epoch_stamp.
>>> -        d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
>>> +        # In most cases this will be a postfuncs of do_unpack.
>>> +        # If we're running in external source, add create_source_date_epoch_stamp
>>> +        # to do_deploy_source_date_epoch instead because there is no do_unpack.
>>> +        if d.getVar('EXTERNALSRC') and bb.data.inherits_class('externalsrc', d):
>>> +            d.appendVarFlag('do_deploy_source_date_epoch', 'prefuncs', ' create_source_date_epoch_stamp')
>>> +        else:
>>> +            d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
>>>           d.appendVar('SSTATETASKS', " do_deploy_source_date_epoch")
>>>           bb.build.addtask('do_deploy_source_date_epoch_setscene', None, None, d)
>>>           bb.build.addtask('do_deploy_source_date_epoch', 'do_configure', 'do_patch', d)
>>
>> Why was create_source_date_epoch_stamp ever added as a do_unpack postfunc in the
>> first place? Why wasn't it invoked directly from do_deploy_source_date_epoch all
>> along? This task runs after do_patch and before do_configure anyway. What am I
>> missing? Are you there, Juro?
> It was put in that place to ensure it was based on the original upstream source,
> and not the patched source.  As the act of patching the source may change the
> dates based on the behavior of patch, filesystem, etc.
>
> So really we do want the date/time from the do_unpack, and before do_patch (or
> any random tasks added between do_unpack and do_patch run.)


True. Good point.


>> If we create_source_date_epoch_stamp (either as a do_deploy_source_date_epoch
>> prefunc or directly invoked), then it should work either way, for externalsrc or
>> not.
> I've got a new set of patches coming shortly.  (I can send patches, but can't
> reply to the list currently.  I've got a configuration problem on my ISP side
> which will hopefully be fixed tomorrow.)
>
>> As an aside, perhaps do_deploy_source_date_epoch should come after do_unpack as
>> well, just in case someone has deleted do_patch:
>>
>>      addtask do_deploy_source_date_epoch before do_configure after do_unpack do_patch
>>
> The new set will keep things as is, removing the confusing
> BUILD_REPRODUCIBLE_BINARIES switching in this class, while moving the special
> behavior to the externalsrc class.  So if we remove the do_unpack, we'll move
> the function to the prefuncs of the do_deploy_source_date_epoch.


Nice.


--------------177875C2F32945B886580278
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 10/09/21 1:05 pm, Mark Hatle wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:796dd7e7-6a0d-a585-7765-bb5621db6128@gmail.com">
      <pre class="moz-quote-pre" wrap="">Unfortunately I'm having problems sending email to the list currently.  But I
can reply directly (feels free to forward this to the list).

On 9/9/21 7:32 PM, Douglas Royds wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 9/09/21 2:51 pm, Mark Hatle wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@xilinx.com">&lt;mark.hatle@xilinx.com&gt;</a>

Externalsrc removes do_fetch, do_unpack, and do_patch.  The system normally
discovers the correct reproducible date as a postfuncs on do_unpack, so this
date is never found, so it goes back to the default epoch.

Instead we can move the discovery function to a prefuncs on the epoch
deploy task.  This task will run before do_configure, and since the source
is already available can run anytime safely.

Signed-off-by: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@xilinx.com">&lt;mark.hatle@xilinx.com&gt;</a>
Signed-off-by: Mark Hatle <a class="moz-txt-link-rfc2396E" href="mailto:mark.hatle@kernel.crashing.org">&lt;mark.hatle@kernel.crashing.org&gt;</a>
---
 meta/classes/reproducible_build.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index a9c117c3b9..ae0723ab21 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -128,7 +128,13 @@ BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
 python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
         # Generate the timestamp with create_source_date_epoch_stamp.
-        d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
+        # In most cases this will be a postfuncs of do_unpack.
+        # If we're running in external source, add create_source_date_epoch_stamp
+        # to do_deploy_source_date_epoch instead because there is no do_unpack.
+        if d.getVar('EXTERNALSRC') and bb.data.inherits_class('externalsrc', d):
+            d.appendVarFlag('do_deploy_source_date_epoch', 'prefuncs', ' create_source_date_epoch_stamp')
+        else:
+            d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
         d.appendVar('SSTATETASKS', " do_deploy_source_date_epoch")
         bb.build.addtask('do_deploy_source_date_epoch_setscene', None, None, d)
         bb.build.addtask('do_deploy_source_date_epoch', 'do_configure', 'do_patch', d)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

Why was create_source_date_epoch_stamp ever added as a do_unpack postfunc in the
first place? Why wasn't it invoked directly from do_deploy_source_date_epoch all
along? This task runs after do_patch and before do_configure anyway. What am I
missing? Are you there, Juro?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It was put in that place to ensure it was based on the original upstream source,
and not the patched source.  As the act of patching the source may change the
dates based on the behavior of patch, filesystem, etc.

So really we do want the date/time from the do_unpack, and before do_patch (or
any random tasks added between do_unpack and do_patch run.)</pre>
    </blockquote>
    <p><br>
    </p>
    <p>True. Good point.</p>
    <p><br>
    </p>
    <p>
    </p>
    <blockquote type="cite"
      cite="mid:796dd7e7-6a0d-a585-7765-bb5621db6128@gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">If we create_source_date_epoch_stamp (either as a do_deploy_source_date_epoch
prefunc or directly invoked), then it should work either way, for externalsrc or
not.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I've got a new set of patches coming shortly.  (I can send patches, but can't
reply to the list currently.  I've got a configuration problem on my ISP side
which will hopefully be fixed tomorrow.)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">As an aside, perhaps do_deploy_source_date_epoch should come after do_unpack as
well, just in case someone has deleted do_patch:

    addtask do_deploy_source_date_epoch before do_configure after do_unpack do_patch

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The new set will keep things as is, removing the confusing
BUILD_REPRODUCIBLE_BINARIES switching in this class, while moving the special
behavior to the externalsrc class.  So if we remove the do_unpack, we'll move
the function to the prefuncs of the do_deploy_source_date_epoch.
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Nice.<br>
    </p>
  </body>
</html>

--------------177875C2F32945B886580278--
