Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1B68726D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 08:44:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBN8iRli008037
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 00:44:27 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 23 Dec 2014 00:44:26 -0800
Message-ID: <54992B6A.7060608@windriver.com>
Date: Tue, 23 Dec 2014 16:44:26 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1418969925.git.Qi.Chen@windriver.com>	<084ad3c5c70057e5f8f06bf85b4543a590a17a54.1418969925.git.Qi.Chen@windriver.com>	<5493C8D0.1040907@topic.nl>
	<5498CBEA.1040708@windriver.com>
	<20141223062542.GA9157@ad.chargestorm.se>
In-Reply-To: <20141223062542.GA9157@ad.chargestorm.se>
X-Originating-IP: [128.224.162.226]
Subject: Re: [PATCH 1/4] packaging: allow globs in CONFFILES
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
X-List-Received-Date: Tue, 23 Dec 2014 08:44:36 -0000
Content-Type: multipart/alternative;
	boundary="------------010803010504050308030700"

--------------010803010504050308030700
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2014 02:25 PM, Anders Darander wrote:
> * ChenQi <Qi.Chen@windriver.com> [141223 02:58]:
>
>> On 12/19/2014 02:42 PM, Mike Looijmans wrote:
>>> On 12/19/2014 07:21 AM, Chen Qi wrote:
>>>> ...
>>>> As almost all files under /etc are basically configuration files, we
>>>> provide a default value for CONFFILES.
>>>>      CONNFFILES = "${sysconfdir}"
>>> This is going to hurt a lot of recipes. Please do not set this.
> Definitely true!
>
>>> The default has always been that CONFFILES is empty. I see no reason
>>> whatsoever to suddenly change this.
>>>> In this way, we don't need to modify every recipe to set the
>>>> CONFFILES variable. Of course, setting CONFFILES in recipes take
>>>> precedence over the CONFFILES. For example, if the recipe author
>>>> decides that package A should only treat files under
>>>> ${sysconfdir}/default/ as config files, he/she can write like this.
>>>>      CONFFILES_A = "${sysconfdir}/default"
>>>> The above situation should not be common. As according to FHS, the
>>>> /etc directory is a place for all system related configuration
>>>> files.
> No, similar lines will be required for quite a few recipes...
>
>>> FHS may have written that somewhere, but if you just take a quick
>>> look at what is in /etc/, you'll find that actual configuration files
>>> are quite rare, but there are tons of scripts and distro related
>>> files there.  Whether or not a file there is supposed to be edited by
>>> the end-user is something of a distro decision.
>>> Also, "configuration file" does not necessarily mean that the USER is
>>> in control. A configuration file may also simply distinguish machine
>>> capabilities or software features.
>>> We'll end up having to patch hundreds of recipes with a CONFFILES=""
>>> or similar line.
>> Most files under /etc are configuration files. If we don't default
>> CONFFILES to ${sysconfdir}, then we have to patch a lot of recipes
>> with CONFFILES_xxx = "xxxx" lines.
> Well, there are a lot of those configuration files, that only the
> distribution will care about. Especially if we're talking embedded
> devices.
>
>> The fact is that when people write recipes, they often forget about
>> CONFFILES.  The typical example is the shadow recipe. And I can easily
>> give you more examples.
> This patch won't help this, it just shifts everything 180 degrees
> around. Now we have to explicitly remove a number of files from
> CONFFILES in a number of packages; which obviously is something that
> people will forget...
>
>> And it's not uncommon that people forget to check CONFFILES when they
>> update the recipe.  When the recipe is updated to a new version, it's
>> possible that the CONFFILES should change.  The typical example is the
>> systemd recipe.
>> *The bad effect of the above? On-target package upgrades override user
>> changes. That's a really annoying problem, isn't it?* Users of OE
>> based projects have complained about this. There were patches on OE
>> which fixed several recipes. But the solution doesn't scale.
> I tend to agree with Mike here. It's better to explicitly add files (or
> directories) in each recipe, as that will make it more obvious which
> files won't get overwritten during a package upgrade. Sure, short-term
> this might mean more patches (I'm nt really sure of the status regarding
> this).
>
> But more importantly, it will keep the determinism and explicit marking
> of CONFFILES. Again, remember that we're primarily talking about
> embedded devices here, where the distibution/distributor quite likely
> need some more control, compared to a regular desktop distribution.


Hi Anders,

I read your comments carefully and thought for a while. Sorry but I 
still insist my opinion.
Please see reasons below.

First of all, I don't think this issue has anything to do with the 
'embedded devices' or 'desktop distribution' thing. The two concepts are 
too large and should not become the reason. Some desktop distributions 
support image based upgrades. Many small embedded devices should only do 
image based upgrades. Most desktop distributions support package based 
upgrades, some embedded devices should also support it.
What we are talking here is on-target package upgrades. If the 
distributor wants to have full control, then its users/customers should 
be suggested to only do image-based upgrades.
But now, let's just focus on package based upgrades.

We have to be aware that package managers are designed to handle config 
files specially. Why they are designed to do so? Because users should 
not be surprised.
Take 'rpm' as an example.

File marked as 	Changed in update RPM? 	On-disk file untouched 	On-disk 
file edited
[default] 	No 	File from update 	File from update
Yes 	File from update 	File from update
%config 	No 	File from update 	Edited file
Yes 	File from update 	File from update, edited file in .rpmsave
%config(noreplace) 	No 	File from update 	Edited file
Yes 	File from update 	Edited file, file from the update in .rpmnew



You can see that it's pretty reasonable.
The problem we have now is that if the user edit a configuration file 
(e.g. /etc/login.defs), the file will still be overridden by upgrades 
even if the file doesn't change in the new package.

Now the focus is whether we should take ${sysconfdir} as the default 
value for CONFFILES.
I strongly think we should. Why? We can easily make use of the power of 
package managers for dealing with configuration files.
If we don't do so, very likely the user changes would be overridden 
silently without informing the user.
This should not happen, especially when the files are under /etc. 
Otherwise we will get angry users or customers. How are we gonna explain 
to them? I don't 'embedded device' could be a satisfactory reason.
Please see the number below. Hope this will reveal the situation of 
CONFFILES in OE.
chenqi@pek-hostel-deb01:~/poky [0] $ find meta meta-openembedded/ -name 
"*.bb" | wc -l
1897
chenqi@pek-hostel-deb01:~/poky [0] $ find meta meta-openembedded/ -name 
"*.bb" -o -name "*.inc" | xargs grep CONFFILES | wc -l
86

Best Regards,
Chen Qi

>> The patchset is an effort to change this situation.
> I don't think we'll gain that much from this patch; rather we'll
> loose...
>
> Cheers,
> Anders
>


--------------010803010504050308030700
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/23/2014 02:25 PM, Anders Darander
      wrote:<br>
    </div>
    <blockquote cite="mid:20141223062542.GA9157@ad.chargestorm.se"
      type="cite">
      <pre wrap="">* ChenQi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a> [141223 02:58]:

</pre>
      <blockquote type="cite">
        <pre wrap="">On 12/19/2014 02:42 PM, Mike Looijmans wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">On 12/19/2014 07:21 AM, Chen Qi wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">...
As almost all files under /etc are basically configuration files, we
provide a default value for CONFFILES.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">    CONNFFILES = "${sysconfdir}"
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">This is going to hurt a lot of recipes. Please do not set this.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">
Definitely true!

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">The default has always been that CONFFILES is empty. I see no reason
whatsoever to suddenly change this.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">In this way, we don't need to modify every recipe to set the
CONFFILES variable. Of course, setting CONFFILES in recipes take
precedence over the CONFFILES. For example, if the recipe author
decides that package A should only treat files under
${sysconfdir}/default/ as config files, he/she can write like this.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">    CONFFILES_A = "${sysconfdir}/default"
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">The above situation should not be common. As according to FHS, the
/etc directory is a place for all system related configuration
files.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="">
No, similar lines will be required for quite a few recipes...

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">FHS may have written that somewhere, but if you just take a quick
look at what is in /etc/, you'll find that actual configuration files
are quite rare, but there are tons of scripts and distro related
files there.  Whether or not a file there is supposed to be edited by
the end-user is something of a distro decision.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">Also, "configuration file" does not necessarily mean that the USER is
in control. A configuration file may also simply distinguish machine
capabilities or software features.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">We'll end up having to patch hundreds of recipes with a CONFFILES=""
or similar line.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">Most files under /etc are configuration files. If we don't default
CONFFILES to ${sysconfdir}, then we have to patch a lot of recipes
with CONFFILES_xxx = "xxxx" lines.
</pre>
      </blockquote>
      <pre wrap="">
Well, there are a lot of those configuration files, that only the
distribution will care about. Especially if we're talking embedded
devices.

</pre>
      <blockquote type="cite">
        <pre wrap="">The fact is that when people write recipes, they often forget about
CONFFILES.  The typical example is the shadow recipe. And I can easily
give you more examples.
</pre>
      </blockquote>
      <pre wrap="">
This patch won't help this, it just shifts everything 180 degrees
around. Now we have to explicitly remove a number of files from
CONFFILES in a number of packages; which obviously is something that
people will forget...

</pre>
      <blockquote type="cite">
        <pre wrap="">And it's not uncommon that people forget to check CONFFILES when they
update the recipe.  When the recipe is updated to a new version, it's
possible that the CONFFILES should change.  The typical example is the
systemd recipe.
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">*The bad effect of the above? On-target package upgrades override user
changes. That's a really annoying problem, isn't it?* Users of OE
based projects have complained about this. There were patches on OE
which fixed several recipes. But the solution doesn't scale.
</pre>
      </blockquote>
      <pre wrap="">
I tend to agree with Mike here. It's better to explicitly add files (or
directories) in each recipe, as that will make it more obvious which
files won't get overwritten during a package upgrade. Sure, short-term
this might mean more patches (I'm nt really sure of the status regarding
this). 

But more importantly, it will keep the determinism and explicit marking
of CONFFILES. Again, remember that we're primarily talking about
embedded devices here, where the distibution/distributor quite likely
need some more control, compared to a regular desktop distribution.
</pre>
    </blockquote>
    <br>
    <br>
    Hi Anders,<br>
    <br>
    I read your comments carefully and thought for a while. Sorry but I
    still insist my opinion.<br>
    Please see reasons below.<br>
    <br>
    First of all, I don't think this issue has anything to do with the
    'embedded devices' or 'desktop distribution' thing. The two concepts
    are too large and should not become the reason. Some desktop
    distributions support image based upgrades. Many small embedded
    devices should only do image based upgrades. Most desktop
    distributions support package based upgrades, some embedded devices
    should also support it.<br>
    What we are talking here is on-target package upgrades. If the
    distributor wants to have full control, then its users/customers
    should be suggested to only do image-based upgrades.<br>
    But now, let's just focus on package based upgrades.<br>
    <br>
    We have to be aware that package managers are designed to handle
    config files specially. Why they are designed to do so? Because
    users should not be surprised.<br>
    Take 'rpm' as an example.<br>
    <br>
    <table align="center" border="1" cellpadding="5">
      <tbody>
        <tr>
          <th>File marked as</th>
          <th>Changed in update RPM?</th>
          <th>On-disk file untouched</th>
          <th>On-disk file edited
          </th>
        </tr>
        <tr align="center">
          <td rowspan="2">[default]</td>
          <td>No</td>
          <td>File from update</td>
          <td>File from update</td>
        </tr>
        <tr align="center">
          <td>Yes</td>
          <td>File from update</td>
          <td>File from update</td>
        </tr>
        <tr align="center">
          <td rowspan="2"><tt>%config</tt></td>
          <td>No</td>
          <td>File from update</td>
          <td>Edited file</td>
        </tr>
        <tr align="center">
          <td>Yes</td>
          <td>File from update</td>
          <td>File from update, edited file in <tt>.rpmsave</tt></td>
        </tr>
        <tr align="center">
          <td rowspan="2"><tt>%config(noreplace)</tt></td>
          <td>No</td>
          <td>File from update</td>
          <td>Edited file</td>
        </tr>
        <tr align="center">
          <td>Yes</td>
          <td>File from update</td>
          <td>Edited file, file from the update in <tt>.rpmnew</tt></td>
        </tr>
      </tbody>
    </table>
    <br>
    <br>
    You can see that it's pretty reasonable.<br>
    The problem we have now is that if the user edit a configuration
    file (e.g. /etc/login.defs), the file will still be overridden by
    upgrades even if the file doesn't change in the new package.<br>
    <br>
    Now the focus is whether we should take ${sysconfdir} as the default
    value for CONFFILES.<br>
    I strongly think we should. Why? We can easily make use of the power
    of package managers for dealing with configuration files.<br>
    If we don't do so, very likely the user changes would be overridden
    silently without informing the user.<br>
    This should not happen, especially when the files are under /etc.
    Otherwise we will get angry users or customers. How are we gonna
    explain to them? I don't 'embedded device' could be a satisfactory
    reason.<br>
    Please see the number below. Hope this will reveal the situation of
    CONFFILES in OE.<br>
    chenqi@pek-hostel-deb01:~/poky [0] $ find meta meta-openembedded/
    -name "*.bb" | wc -l<br>
    1897<br>
    chenqi@pek-hostel-deb01:~/poky [0] $ find meta meta-openembedded/
    -name "*.bb" -o -name "*.inc" | xargs grep CONFFILES | wc -l<br>
    86<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:20141223062542.GA9157@ad.chargestorm.se"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">The patchset is an effort to change this situation.
</pre>
      </blockquote>
      <pre wrap="">
I don't think we'll gain that much from this patch; rather we'll
loose...

Cheers,
Anders

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------010803010504050308030700--
