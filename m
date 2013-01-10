Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tt8AO-0002ap-QE
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 03:46:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0A2VdQ2005860
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2013 18:31:39 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 9 Jan 2013 18:31:38 -0800
Message-ID: <50EE2822.9050108@windriver.com>
Date: Thu, 10 Jan 2013 10:32:02 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <D9D7124626ED1E43963D86B2657D5CCD04EA51DA@FRSNPREXC1.usr.ingenico.loc>
In-Reply-To: <D9D7124626ED1E43963D86B2657D5CCD04EA51DA@FRSNPREXC1.usr.ingenico.loc>
X-Originating-IP: [128.224.163.154]
Subject: Re: sstate, cache or licence issue?
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
X-List-Received-Date: Thu, 10 Jan 2013 02:47:10 -0000
Content-Type: multipart/alternative;
	boundary="------------070809040901020505040208"

--------------070809040901020505040208
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2013 01:40 AM, Matthieu CRAPET wrote:
>
> Dear all,
>
> I've got some trouble with my today's update to oe-core.
>
> I created a basic (image) recipe:
>
> ---
>
> DESCRIPTION = "A console-only production image with headers."
>
> PR = "r0"
>
> LICENSE = "MIT"
>
> IMAGE_FEATURES += "dev-pkgs debug-tweaks package-management 
> ssh-server-openssh"
>
> inherit core-image
>
> IMAGE_INSTALL += "openssh openssl directfb directfb-examples"
>
> ---
>
> I've got a do_populate_lic failure but image is generated correctly 
> (do_rootfs is ok). It fails in sstate_create_package
>
> | DEBUG: Executing shell function sstate_create_package
>
> | shell-init: error retrieving current directory: getcwd: cannot 
> access parent directories: No such file or directory
>
> | chdir: error retrieving current directory: getcwd: cannot access 
> parent directories: No such file or directory
>
> run.sstate_create_package.$PID
>
> sstate_create_package() {
>
>         cd 
>  /lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image/1.0-r0/sstate-build-populate-lic/
>
>         TFILE=`mktemp ...
>
> ...
>
> The problem is that the directory exists (containing 
> license-destdir/test-image/{COPYING.MIT,LICENSE,generic_MIT})
>
> If re-bitbake recipe, works fine.
>
> If I "bitbake -c cleanall" first + manually delete recipe directory 
> (/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image) 
> then, re-bitbake recipe: the do_populate_lic fails again.
>
> More surprising: if I wait some times (few minutes). I re-get the 
> error but with the extra lines:
>
> | DEBUG: Removing manifest: 
> /lingot/build/tmp-eglibc/deploy/licenses/test-image/LICENSE
>
> | DEBUG: Removing manifest: 
> /lingot/build/tmp-eglibc/deploy/licenses/test-image/COPYING.MIT
>
> | DEBUG: Removing manifest: 
> /lingot/build/tmp-eglibc/deploy/licenses/test-image/generic_MIT
>
> | DEBUG: Removing manifest: 
> /lingot/build/tmp-eglibc/deploy/licenses/test-image/
>
> I added and removed package in IMAGE_INSTALL, sometimes it passes, 
> sometimes not, maybe there is a concurrent access somewhere?
>

Maybe it's the same bug with bug#3674 
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3674).

Cheers,
Chen Qi

> The two logs are available here:
>
> http://pastebin.com/raw.php?i=CVczF2vB
>
> Notice that I'm using my own external toolchain but I don't know that 
> It is relevant.
>
> Any hint appreciated here!
>
> Regards,
>
> Matthieu Crapet
>
> *About Ingenico *(Euronext: FR0000125346 - ING)
>
> Ingenico is a leading provider of payment solutions, with over 17 
> million terminals deployed in more than 125 countries. Its 3,600 
> employees worldwide support retailers, banks and service providers to 
> optimize and secure their electronic payments solutions, develop their 
> offer of services and increase their point of sales revenue.
>
> More information on*www.ingenico.com <http://www.ingenico.com/>.*
>
> This message may contain confidential and/or privileged information. 
> If you are not the addressee or authorized to receive this for the 
> addressee, you must not use, copy, disclose or take any action based 
> on this message or any information herein. If you have received this 
> message in error, please advise the sender immediately by reply e-mail 
> and delete this message. Thank you for your cooperation.
>
> PPlease consider the environment before printing this e-mail
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------070809040901020505040208
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/10/2013 01:40 AM, Matthieu CRAPET
      wrote:<br>
    </div>
    <blockquote
cite="mid:D9D7124626ED1E43963D86B2657D5CCD04EA51DA@FRSNPREXC1.usr.ingenico.loc"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <meta content="Microsoft Word 14 (filtered medium)"
        name="Generator">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <style><!-- /* Style Definitions */ p.6271aeb8-3e0c-4268-9157-9618eb0e7060, li.6271aeb8-3e0c-4268-9157-9618eb0e7060, div.6271aeb8-3e0c-4268-9157-9618eb0e7060, table.6271aeb8-3e0c-4268-9157-9618eb0e7060Table	{margin:0cm; margin-bottom:.0001pt;}div.Section1 {page:Section1;}--></style>
      <div>
        <div class="WordSection1">
          <p class="MsoNormal">Dear all,<o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal"><span lang="EN-GB">I&#8217;ve got some trouble
              with my today&#8217;s update to oe-core.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">I created a basic
              (image) recipe:<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">---<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">DESCRIPTION = "A
              console-only production image with headers."<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">PR = "r0"<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">LICENSE = "MIT"<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">IMAGE_FEATURES +=
              "dev-pkgs debug-tweaks package-management
              ssh-server-openssh"<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">inherit core-image<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">IMAGE_INSTALL +=
              "openssh openssl directfb directfb-examples"<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">---<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">I&#8217;ve got a
              do_populate_lic failure but image is generated correctly
              (do_rootfs is ok). It fails in sstate_create_package<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">| DEBUG: Executing
              shell function sstate_create_package<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">| shell-init: error
              retrieving current directory: getcwd: cannot access parent
              directories: No such file or directory<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">| chdir: error
              retrieving current directory: getcwd: cannot access parent
              directories: No such file or directory<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">run.sstate_create_package.$PID<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">sstate_create_package()
              {<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd
&nbsp;/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image/1.0-r0/sstate-build-populate-lic/<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TFILE=`mktemp
              &#8230;<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">&#8230;<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">The problem is that
              the directory exists (containing
              license-destdir/test-image/{COPYING.MIT,LICENSE,generic_MIT})<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">If re-bitbake recipe,
              works fine.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">If I &#8220;bitbake -c
              cleanall&#8221; first + manually delete recipe directory
              (/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image)
              then, re-bitbake recipe: the do_populate_lic fails again.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">More surprising: if I
              wait some times (few minutes). I re-get the error but with
              the extra lines:<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">| DEBUG: Removing
              manifest:
              /lingot/build/tmp-eglibc/deploy/licenses/test-image/LICENSE<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">| DEBUG: Removing
              manifest:
              /lingot/build/tmp-eglibc/deploy/licenses/test-image/COPYING.MIT<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">| DEBUG: Removing
              manifest:
              /lingot/build/tmp-eglibc/deploy/licenses/test-image/generic_MIT<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">| DEBUG: Removing
              manifest:
              /lingot/build/tmp-eglibc/deploy/licenses/test-image/<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">I added and removed
              package in IMAGE_INSTALL, sometimes it passes, sometimes
              not, maybe there is a concurrent access somewhere?<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
        </div>
      </div>
    </blockquote>
    <br>
    Maybe it's the same bug with bug#3674
    (<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=3674">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3674</a>).<br>
    <br>
    Cheers,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:D9D7124626ED1E43963D86B2657D5CCD04EA51DA@FRSNPREXC1.usr.ingenico.loc"
      type="cite">
      <div>
        <div class="WordSection1">
          <p class="MsoNormal"><span lang="EN-GB">The two logs are
              available here:<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><a
                moz-do-not-send="true"
                href="http://pastebin.com/raw.php?i=CVczF2vB">http://pastebin.com/raw.php?i=CVczF2vB</a><o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">Notice that I&#8217;m using
              my own external toolchain but I don&#8217;t know that It is
              relevant.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">Any hint appreciated
              here!<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB"><o:p>&nbsp;</o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">Regards,<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-GB">Matthieu Crapet<o:p></o:p></span></p>
        </div>
      </div>
      <div>&nbsp;</div>
      <div style="FONT-FAMILY: Courier New; FONT-SIZE: 9pt"><font
          face="Arial" size="1">
          <p style="TEXT-ALIGN: justify"><span><font face="Arial"
                size="2"><strong>About Ingenico </strong>(Euronext:
                FR0000125346 - ING)</font></span></p>
          <p style="TEXT-ALIGN: justify"><span><span style="FONT-FAMILY:
                Arial; FONT-SIZE: 10pt; mso-ansi-language: EN-GB"
                lang="EN-GB"><span style="FONT-FAMILY: Arial; COLOR:
                  black; FONT-SIZE: 10pt; mso-ansi-language: FR;
                  mso-fareast-font-family: 'Times New Roman';
                  mso-fareast-language: FR; mso-bidi-language: AR-SA">Ingenico
                  is a leading provider of payment solutions, with over
                  17 million terminals deployed in more than 125
                  countries.&nbsp;Its 3,600 employees worldwide support
                  retailers, banks and service providers to optimize and
                  secure their electronic payments solutions, develop
                  their offer of services and increase their point of
                  sales revenue.</span></span></span></p>
          <p style="TEXT-ALIGN: justify"><span><span style="FONT-FAMILY:
                Arial; FONT-SIZE: 10pt; mso-ansi-language: EN-GB"
                lang="EN-GB"><span style="FONT-FAMILY: Arial; COLOR:
                  black; FONT-SIZE: 10pt; mso-ansi-language: FR;
                  mso-fareast-font-family: 'Times New Roman';
                  mso-fareast-language: FR; mso-bidi-language: AR-SA">More
                  information on</span></span></span><span><strong><span
                  style="FONT-FAMILY: Arial; FONT-SIZE: 10pt;
                  mso-ansi-language: EN-GB" lang="EN-GB"><span
                    style="COLOR: red"> <a moz-do-not-send="true"
                      href="http://www.ingenico.com/"><span
                        style="COLOR: red"><font color="#ff0000">www.ingenico.com</font></span></a></span>.</span></strong></span></p>
          <p style="TEXT-ALIGN: justify"><span style="FONT-FAMILY:
              'Arial','sans-serif'; FONT-SIZE: 7.5pt"><font size="1">This
                message may contain confidential and/or privileged
                information. If you are not the addressee or authorized
                to receive this for the addressee, you must not use,
                copy, disclose or take any action based on this message
                or any information herein. If you have received this
                message in error, please advise the sender immediately
                by reply e-mail and delete this message. </font></span><span
              style="FONT-FAMILY: 'Arial','sans-serif'; FONT-SIZE:
              7.5pt"><font size="1">Thank you for your cooperation.</font></span></p>
          <p class="MsoNormal"><span style="FONT-FAMILY:
              'Arial','sans-serif'; FONT-SIZE: 7.5pt">&nbsp;</span><span
              style="FONT-FAMILY: Webdings; COLOR: green; FONT-SIZE:
              12pt" lang="EN-GB">P</span><span style="FONT-FAMILY:
              'Arial','sans-serif'; COLOR: black" lang="EN-GB"> </span><span
              style="FONT-FAMILY: 'Arial','sans-serif'; COLOR: green;
              FONT-SIZE: 7.5pt" lang="EN-GB">Please consider the
              environment before printing this e-mail</span></p>
        </font></div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070809040901020505040208--
